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
    poll = Poll.create(:question => params[:body])
    tweet = @auth.twitter.update(poll.question)
    poll.tweet_id = tweet.id
    poll.datetime = tweet.created_at
    @auth.polls << poll
    redirect_to root_path
  end
end