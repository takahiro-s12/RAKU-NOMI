class GroupUsersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @users = current_user.follower_user & current_user.following_user
    @group_user = GroupUser.new(group_user_params)
    @group_user.save
    @group = Group.find(params[:group_id])
    @group.create_notification_add_user!(current_user)
  end

  def destroy
    @group = Group.find(params[:group_id])
    GroupUser.find(params[:id]).destroy
    @group_user = @group.users.where(group_id: @group.id)
  end

  private

  def group_user_params
    params.require(:group_user).permit(:user_id, :group_id)
  end
end
