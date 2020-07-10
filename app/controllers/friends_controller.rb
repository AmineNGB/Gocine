class FriendsController < ApplicationController
  def index
    @requests = current_user.requested_friends
    @pending = current_user.pending_friends
    @friends = current_user.friends
  end

  def create
    @user.friend_request(User.find_by(id: params[:id]))
  end

  def destroy
    @user.remove_friend(User.find_by(id: params[:id]))
    redirect_to riends_path
  end

  def add
    @user.accept_request(User.find_by(id: params[:id]))
  end

  def reject
    @user.decline_request(User.find_by(id: params[:id]))
  end
end
