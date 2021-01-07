class GroupUsersController < ApplicationController
  
  def create
    @group = Group.find(params[:group_id])
    @group_user = @group.group_users.new
    @group_user.group_id = @group.id
    @users = current_user.following_user & current_user.follower_user
  end

  def destroy
  end
end
