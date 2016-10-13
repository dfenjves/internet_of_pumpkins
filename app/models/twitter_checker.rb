


class TwitterChecker

  ALL_TWEETS = []

  def initialize(username)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
    @username = username
  end

  def latest_tweet
    @client.user_timeline(@username).first.text
  end

  def new_tweet?
    latest_tweet = self.latest_tweet
    if latest_tweet == ALL_TWEETS.last
      return false
    else
      ALL_TWEETS << latest_tweet
      return true
    end
  end

end
