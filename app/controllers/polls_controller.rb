class PollsController < ApplicationController
  def index
    @poll = Poll.new
  end
  def show
    @poll = Poll.find(id)
  end
  def new
  end
  def create
    binding.pry
    poll = Poll.create(:question => params[:body])
    binding.pry
    tweet = @auth.twitter.update(poll.question)
    binding.pry
    poll.tweet_id = tweet.id
    poll.datetime = tweet.created_at
    @auth.polls << poll
    binding.pry
  end
end