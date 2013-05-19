# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  tweet_id   :string(255)
#  datetime   :datetime
#  body       :string(255)
#  name       :string(255)
#  poll_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Response < ActiveRecord::Base
  attr_accessible :tweet_id, :datetime, :body, :name, :poll_id
  has_many :suggestions
  belongs_to :poll
  after_save :parse

  def parse

  end

end
