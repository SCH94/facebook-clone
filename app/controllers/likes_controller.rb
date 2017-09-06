class LikesController < ApplicationController
  def create
    Like.create(post_id: params['like']['post_id'], user_id: current_user.id)
    Notification.create(user_id: Post.find(params['like']['post_id']).user_id, message: "#{current_user.full_name} just liked your post.")
    redirect_to posts_path
  end

  def destroy
    Like.find(params['id']).delete
    redirect_to posts_path
  end
  
  
end
