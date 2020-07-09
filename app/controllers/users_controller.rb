class UsersController < ApplicationController
  def profile
    # @friend_requests = current_user.requested_friends
  end

  def delete_friend
    @friend = User.find(params[:id])
    current_user.remove_friend(@friend)
    redirect_to pages_friends_path
  end

  def accept_friend
    @friend = User.find(params[:id])
    current_user.accept_request(@friend)
    redirect_to pages_friends_path
  end

  def decline_friend
    @friend = User.find(params[:id])
    current_user.decline_request(@friend)
    redirect_to pages_friends_path
  end

  def request_friend
    @friend = User.find_by(email: params[:email])

    if @friend
      current_user.friend_request(@friend)
      flash[:notice] = "Ami ajouté avec succès !"
      redirect_to pages_friends_path
    else
      flash[:alert] = "Aucun compte trouvé avec cet email !"
      redirect_to pages_friends_path
    end
  end
end
