require_relative '../../db/config'
require 'Twitter'

class Tweet < ActiveRecord::Base
	belongs_to :senator

	def to_s
		"-- #{content}\n"
	end
end


module Twitter_stuff
	attr_accessor :client
attr_accessor :twitter_members

	def create_client
		@client = Twitter::REST::Client.new do |config|
		  config.consumer_key        = "2YopdUSKiS8dEOcEpXw"
		  config.consumer_secret     = "dV5NnYWJ9djukGYr91sAINs0biqUAfWXlzVTKVQ"
		  config.access_token        = "1438670803-VtKJ6yuriQLF0CmGg7HMUAU9At4DJ4XuLYrjbA3"
		  config.access_token_secret = "LpPHyVNIX2CV913s9pM7IHwCO5WnITqoc06eJsSxvN8WH"
		end
	end

	def grab_tweets(senator_id)
		client.user_timeline(Senator.find(senator_id).twitter_id, count: 10).each do |tweet|
		    Tweet.create(senator_id: senator_id, content: tweet.text)
  		end
	end

	def display_tweets_for_senator(senator_id)
		puts Senator.find(senator_id)
		puts Senator.find(senator_id).tweets

	end

end