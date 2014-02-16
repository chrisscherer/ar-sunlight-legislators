class CreateTweets < ActiveRecord::Migration
	def change
		create_table :tweets do |t|
			t.integer :senator_id
			t.text :content
		end
	end
end