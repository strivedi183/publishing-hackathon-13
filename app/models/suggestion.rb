# == Schema Information
#
# Table name: suggestions
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  author      :string(255)
#  isbn        :string(255)
#  response_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Suggestion < ActiveRecord::Base
  attr_accessible :title, :author, :isbn, :response_id
  has_many :categories
  belongs_to :response
end
