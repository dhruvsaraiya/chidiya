class Tweet
  include Mongoid::Document
  include Mongoid::Timestamps

  has_one :author
  has_many :likes
  has_many :retweets
  has_one :parent_tweet

  field :comment, type: String

  def like!
    puts "Like"
  end

  def retweet!(message)
    puts "Retweet with ", message
  end
end
