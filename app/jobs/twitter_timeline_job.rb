class TwitterTimelineJob < ApplicationJob
  def perform(twitter_handle)
    # get all tweets from twitter for twitter_handle
    tweets = DonatableTweets.twitter.user_timeline(twitter_handle)
    # create a tweet in our database for each tweet returned from twitter's API
    tweets.each do |tweet|
      existing_tweet = Tweet.find_by(tweet_id: tweet.id)
      if existing_tweet.nil?
        Tweet.create(
          author: twitter_handle,
          message: tweet.text,
          tweeted_at: tweet.created_at,
          tweet_id: tweet.id
        )
      end
    end
  end
end
