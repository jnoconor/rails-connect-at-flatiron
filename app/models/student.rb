class Student < ActiveRecord::Base
  belongs_to :cohort

  def twitter_handle
    username(:twitter)
  end

  def github_handle
    username(:github)
  end

  private
  # works for RESTful URLs such as http://www.twitter.com/boredelonmusk
  def username(service)
    send(service).to_s[/\w+$/] || ""
  end

end
