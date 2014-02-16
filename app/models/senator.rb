require_relative '../../db/config'

class Senator < ActiveRecord::Base
	has_many :tweets
	
  def to_s
    "#{firstname} #{lastname}, (#{party})"
  end
end