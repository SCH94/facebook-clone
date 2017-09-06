class CommentsController < ApplicationController
  
  def create
    @post = Post.find(params['comment']['post_id'])
    current_user.comments.create(post_id: @post.id, comment_text: params['comment']['comment_text'])
    Notification.create(user_id: @post.user_id, message: "#{current_user.full_name} just commented on your post")
    redirect_to posts_path
  end
  
  def destroy
  end
  
end
