# == Schema Information
#
# Table name: polls
#
#  id         :integer          not null, primary key
#  tweet_id   :string(255)
#  datetime   :datetime
#  question   :string(255)
#  is_active  :boolean          default(TRUE)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Poll < ActiveRecord::Base
  attr_accessible :tweet_id, :datetime, :question, :is_active, :user_id
  has_many :tags
  has_many :responses
  belongs_to :user

  def get_responses
    user = User.find(self.user_id)
    tweets = user.twitter.mentions_timeline
    tweets.each do |tweet|
      binding.pry
      response = Response.create
      self.responses << response
    end
  end
end
