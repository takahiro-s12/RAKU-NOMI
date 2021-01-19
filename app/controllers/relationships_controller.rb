class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  
  def follow
    @user = User.find(params[:id])
    current_user.follow(params[:id])
    @user.create_notification_follow!(current_user)
    redirect_back(fallback_location: users_search_path)
  end

  def unfollow
    current_user.unfollow(params[:id])
    redirect_back(fallback_location: users_search_path)
  end
end
