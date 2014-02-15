require_relative '../../db/config'

class Senator < ActiveRecord::Base
  def to_s
    "#{firstname} #{lastname}, (#{party})"
  end
end