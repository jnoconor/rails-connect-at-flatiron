require 'open-uri'

class CohortScraper
  attr_accessor :cohort, :doc

  def initialize(name, url)
    @cohort = Cohort.find_or_create_by(:name => name, :url => url)
    set_html_doc
    save_member_info
  end

  def set_html_doc
    @doc = Nokogiri::HTML(open(@cohort.url))
  end

  def all_member_data
    @doc.css("div.section.section-blog ul li.home-blog-post")
  end

  def get_member_links
    all_member_data.collect do |member|
      @cohort.url + member.css("div.big-comment h3 a").attribute("href").value
    end
  end

  def save_member_info
    get_member_links.each do |page_link|
      data = Nokogiri::HTML(open(page_link))
      Student.create! do |student|
        student.full_name = name(data)
        student.twitter = twitter(data)
        student.linkedin = linkedin(data)
        student.github = github(data)
        student.work_title = work_title(data)
        student.personal_project = personal_project(data)
        student.profile_image = profile_image(data)
        student.quote = quote(data)
        student.bio = bio(data)
        student.education = education(data)
        student.cohort = @cohort
      end
    end
  end

  def name(data)
    data.css("h4.ib_main_header").text
  end

  def twitter(data)
    data.css("i.icon-twitter").first.parent.attribute("href").value
  end

  def linkedin(data)
    data.css("i.icon-linkedin-sign").first.parent.attribute("href").value
  end

  def github(data)
    data.css("i.icon-github").first.parent.attribute("href").value
  end

  def work_title(data)
    begin
      data.css("div.services p").each do |paragraph|
        paragraph.text
      end.join(", ")
    rescue
      value_missing
    end
  end

  def personal_project(data)
    begin
      data.css('h3:contains("Personal Projects")')[0].parent.parent.children[-2].text
    rescue
      value_missing
    end
  end

  def profile_image(data)
    data.css('.top-page-title div img')[0].attributes["src"].value.gsub("../", @cohort.url)
  end

  def quote(data)
    data.css('div.textwidget h3').text
  end

  def bio(data)
    data.css('div.services p').collect do |link|
      link.content.strip if link.element_children.empty?
    end.compact[0]
  end

  def education(data)
    data.css('div.services ul li').collect do |link|
      link.content
    end.join(",")
  end

  def value_missing
    "Coming Soon..."
  end

end