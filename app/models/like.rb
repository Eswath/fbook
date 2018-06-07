class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :user, uniqueness: {scope: :post}
 # def self.like(user_id, post_id)

 #  	if Like.find_by(post_id).present?

 #  		user_ids = Like.find_by(post_id)
 #  		user_id_string = user_ids["user_ids"].to_s
 #  		user_id = user_id.to_s
 #  		post_id = post_id.to_s
  	
 #  		final_string = (user_id_string + "," + user_id)
  		
 #  		if user_ids.update_column(:user_ids, final_string)
 #  			return 1
 #  		end
 #  	end
 #  end
end
