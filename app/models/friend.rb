class Friend < ActiveRecord::Base
  has_many :user_friends
  has_many :users, through: :user_friends

  validates_uniqueness_of :username, :scope => :provider

  def self.find_user_friends(user)
    self.joins(:users)
    .where(:provider => user.provider, users: {:id => user.id})
  end
end
