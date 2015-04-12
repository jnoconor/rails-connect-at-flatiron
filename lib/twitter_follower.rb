class TwitterFollower

  attr_reader :client

  def initialize (user)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = user.token
      config.access_token_secret = user.secret
    end
  end

  def follow_users(handle_array)
    users = not_followed_or_requested(handle_array)
    @client.follow(users) if !users.empty?
  end

  def get_image_url
    @client.user.profile_image_url.site + @client.user.profile_image_url.path
  end

  def not_followed_or_requested(handle_array)
    @client.friendships(handle_array).select do |user|
      connection = user[:connections]
      !(connection.include?("following") || connection.include?("following_requested"))
    end
  end

end