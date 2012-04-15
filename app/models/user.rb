class User < ActiveRecord::Base
	has_many :tourists
  attr_accessor :friends
end
