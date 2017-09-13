class MyRegistrationsController < Devise::RegistrationsController
  
  def create
    super
    if @user.persisted?
      UserMailer.account_activation(@user).deliver_now
    end
  end
  
end