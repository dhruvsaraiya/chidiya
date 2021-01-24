class Api::V1::TweetsController < ApplicationController
  before_action :authenticate_user!
  def index
    tweets = Tweet.order_by(created_at: :desc)
    render json: tweets
  end

  def create
    tweet = Tweet.create!(create_tweet_params)
    render json: tweet
  end

  def show
    tweet = Tweet.find(params[:id])
    render json: tweet
  end

  def like
    tweet = Tweet.find(params[:id])
    tweet.like!
    render json: tweet
  end

  def retweet
    tweet = Tweet.find(params[:id])
    tweet.retweet!(params[:comment])
    render json: tweet
  end

  private

  def create_tweet_params
    params.require(:tweet).permit(:comment)
  end
end
