class FriendRequestsController < ApplicationController
  
  def create
    FriendRequest.create(requestor_id: current_user.id, requested_id: params['friend_request']['receiver_id'])
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
    current_user.friend(friend)
    redirect_to users_path
  end
  
  def reject
    request = FriendRequest.find(params['request_id'])
    friend = User.find(request.requestor_id)
    current_user.unfriend(friend)
    redirect_to users_path
  end

end
