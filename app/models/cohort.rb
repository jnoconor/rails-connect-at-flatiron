class Cohort < ActiveRecord::Base
  has_many :students

  validates :name, {:presence => true, :uniqueness => true}
end
