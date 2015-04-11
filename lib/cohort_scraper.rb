class CohortScraper
  attr_accessor :url

  def initialize(url)
    @url = url
    get_member_links
    save_member_info
  end

  def get_html_doc(url)
    raw_data = open(url)
    Nokogiri::HTML(raw_data)
  end

  def all_member_data
    data = get_html_doc(self.url)
    data.css("div.section.section-blog ul li.home-blog-post")
  end

  def get_member_links
    all_member_data.each do |member_doc|
      link = self.url + member_doc.css("div.big-comment h3 a").attribute("href")
      self.member_links << link
    end
  end

  def save_member_info
    self.member_links.collect do |page_link|
        data = get_html_doc(page_link)
        handle = member_handle(data)
        name = member_name(data)
        next if handle == nil

        s = Member.find_or_create_by(:full_name => name)
        s.first_name = name.split(' ')[0...-1].join(' ')
        s.last_name = name.split(' ')[-1]
        s.handle = member_handle(data)
        s.session = self.session
        s.save
    end
  end

  def member_handle(data)
    handle = data.css("i.icon-twitter").first.parent.attribute("href").value
    handle[/\/\w+\z/].gsub("/","") if handle[/\/\w+\z/]
  end

  def member_name(data)
    data.css("img.swiss-knife-icon").first.parent.text
  end

end