class UsersController < ApplicationController
  def profile
  end

  def delete_friend
    @friend = User.find(params[:id])
    current_user.remove_friend(@friend)
    redirect_to pages_friends_path
  end
end
