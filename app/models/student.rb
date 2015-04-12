class Student < ActiveRecord::Base
  belongs_to :cohort

  def twitter_handle
    self.twitter[/\/\w+\z/].gsub("/","") if self.twitter[/\/\w+\z/]
  end
end
