class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :posts

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash['info'] = "Your account has been created"
      redirect_to root_path
    else
      flash['error'] = "There was an error creating your account"
      redirect_to root_path
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :surname, :email, :password, :gender)
  end

end
