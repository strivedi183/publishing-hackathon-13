class PollsController < ApplicationController
  def index
    @poll = Poll.new
  end
  def show
    @poll = Poll.find(params[:id])
    @poll.get_responses
  end
  def new
  end
  def create
    begin
      tweet = @auth.twitter.update(params[:body])
      poll = Poll.create(:question => params[:body])
      poll.tweet_id = tweet.id
      poll.datetime = tweet.created_at
      @auth.polls << poll
    rescue
    end
    redirect_to root_path
  end
end