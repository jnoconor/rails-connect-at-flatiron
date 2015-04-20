class GithubFollower

  attr_reader :client

  def initialize(user)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['GITHUB_KEY']
      config.consumer_secret     = ENV['GITHUB_SECRET']
      config.access_token        = user.token
      config.access_token_secret = user.secret
    end
  end

  
  
end