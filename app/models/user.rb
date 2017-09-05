class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :posts
  
  has_many :received_requests, class_name: :FriendRequest, foreign_key: :requested_id
  has_many :sent_requests, class_name: :FriendRequest, foreign_key: :requestor_id
  
  has_many :sent_pending_friends, through: :sent_requests, source: :requested
  has_many :received_pending_friends, through: :received_requests, source: :requestor
  
  has_many :friendships, foreign_key: :from_id
  has_many :friends, through: :friendships, source: :to
  

  def full_name
    "#{name} #{surname}"
  end
  
  def notifications
    posts = Post.all.limit(5)
    result = Array.new
    posts.each do |post|
      result << "#{post.user.name} added a new picture"
    end
    result
  end
  
  
  def unfriend(user)
    request = FriendRequest.find_by(requestor_id: id, requested_id: user.id)
    request.delete unless request.nil?
    request = FriendRequest.find_by(requestor_id: user.id, requested_id: id)
    request.delete unless request.nil?
    friendship = Friendship.find_by(from_id: id, to_id: user.id)
    friendship.delete unless friendship.nil?
    friendship = Friendship.find_by(from_id: user.id, to_id: id)
    friendship.delete unless friendship.nil?
  end
  
  def friend(user)
    request = FriendRequest.find_by(requestor_id: user.id, requested_id: id)
    request.status = "Accepted"
    request.save
    Friendship.create(from_id: id, to_id: user.id)
    Friendship.create(from_id: user.id, to_id: id)
  end
  
  def feed
    friend_ids = "SELECT to_id FROM friendships WHERE from_id = :user_id"
    Post.where("user_id IN (#{friend_ids}) OR user_id = :user_id", user_id: id) #current_user.id) 
  end
  
  

  
  private
  def user_params
    params.require(:user).permit(:name, :surname, :email, :password, :gender)
  end
  

end
