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

  # searches the open library api for books and returns a json object
  def search(query)
    query = query.gsub(' ','+')
    url = "http://openlibrary.org/search.json?q=#{query}"
    json = JSON.parse HTTParty.get(url)
    self.create_suggestion(json)
  end

  #  creates a suggestion object based on the search
  def create_suggestion(json)
    json['docs'].each do |doc|
      binding.pry
      title = doc['title_suggest']
      author = doc['author_name']
      publisher = doc['publisher']
      isbn = doc['isbn'][0]
      suggestion = Suggestion.create(:title=>title,:author=>author,:isbn=>isbn)
      suggestion.response = self
      suggestion.save
    end
  end
end
