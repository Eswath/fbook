class Post < ApplicationRecord
	validates :user_id, presence: true
	belongs_to :user
	has_many :likes

	def self.like
    	@msg = "aravind"
  	end


end
