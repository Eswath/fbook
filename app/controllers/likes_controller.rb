class LikesController < ApplicationController
	 def create
	    @user = params[:user_id]
	    @post = params[:post_id]
	    @ids_array = []
	    user_id = @user
	    post_id = @post
	    if Like.find_by(:post => @post).present?
	  		user_ids = Like.find_by(:post => @post)
	  		user_id_string = user_ids["user_ids"].to_s
	  		user_id = user_id.to_s
	  		post_id = post_id.to_s
	  		if user_id_string.present?
	  			final_string = (user_id_string + "," + user_id)
	  			@ids_array = final_string.split(",")
				val_present = 0
				if user_id.in? @ids_array
					puts "s"
					val_present = 1
				end
				# binding.pry
	  		else
	  			final_string = user_id
	  		end
	  		status = 0
	  		if val_present == 0
	  			if user_ids.update_column(:user_ids, final_string)
	  				status = 1
	  			end
	  		end
  		else
  			 post_user_id = Post.find_by(:id => @post)
  			 likes = {user_id: post_user_id["user_id"], post_id: @post, user_ids: user_id}
	    	 @like = Like.new(likes)
	    	 @like.save!
  		end
	    
	    if status == 1
	      redirect_to posts_path
	    else
	     redirect_to posts_path
	    end
	  end


end
