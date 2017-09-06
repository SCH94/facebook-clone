class FriendRequestsController < ApplicationController
  
  def create
    FriendRequest.create(requestor_id: current_user.id, requested_id: params['friend_request']['receiver_id'])
    Notification.create(user_id: params['friend_request']['receiver_id'], message: "#{current_user.full_name} just sent you a friend request")
    redirect_to users_path
  end
  
  def destroy
    request = FriendRequest.find_by(requestor_id: current_user.id, requested_id: params['receiver_id'])
    request.delete
    redirect_to users_path
  end
  
  def accept
    request = FriendRequest.find(params['request_id'])
    friend = User.find(request.requestor_id)
    friend.notifications.create(message: "#{current_user.full_name} just accepted your friend requset!")
    current_user.friend(friend)
    redirect_to users_path
  end
  
  def reject
    request = FriendRequest.find(params['request_id'])
    friend = User.find(request.requestor_id)
    current_user.unfriend(friend)
    redirect_to users_path
  end
  
  def random
    random_id = rand(User.count) + 1 
    random_user = User.find(random_id)
    FriendRequest.create(requestor_id: random_id, requested_id: current_user.id)
    Notification.create(user_id: current_user.id, message: "#{random_user.full_name} just sent you a friend request")
    redirect_to users_path
  end
  
end
