class Cohort < ActiveRecord::Base
  has_many :students

  validates :name, {:presence => true, :uniqueness => true}

  def student_twitter_handles(user)
    self.students.collect(&:twitter_handle).tap do |handles|
      handles.compact!.delete(user.username)
    end
  end
end
