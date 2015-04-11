class User < ActiveRecord::Base

  validates :provider, :uid, {:presence => true}
  validates_uniqueness_of :uid, :scope => :provider

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
    end
  end
end
