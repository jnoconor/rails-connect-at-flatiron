class User < ActiveRecord::Base
  has_many :user_friends
  has_many :friends, through: :user_friends

  validates :provider, :uid, {:presence => true}
  validates_uniqueness_of :uid, :scope => :provider

  def add_friends(usernames)
    usernames.each do |username|
      self.friends.create(:provider => self.provider, :username => username)
    end
  end

  def self.find_or_create_from_auth_hash(auth)
    User.find_by(:provider => auth["provider"], :uid => auth["uid"]) || User.create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.token = auth["credentials"]["token"]
      user.secret = auth["credentials"]["secret"]
      user.username = auth["info"]["nickname"]
      user.img_url = TwitterFollower.new(user).get_image_url
    end
  end
end
