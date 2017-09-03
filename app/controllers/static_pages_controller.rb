class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to posts_path
    else
      @user = User.new
    end
  end
end
