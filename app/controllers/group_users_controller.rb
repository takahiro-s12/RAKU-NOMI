class GroupUsersController < ApplicationController
  def create
    @users = current_user.follower_user & current_user.following_user
    @group_user = GroupUser.new(group_user_params)
    @group = Group.find(params[:group_id])
    if @group_user.save
      redirect_to edit_group_path(@group)
    else
      render 'groups/edit'
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    GroupUser.find_by( user_id: params[:user_id], group_id: params[:group_id] ).destroy
    redirect_to group_path(params[:group_id])
  end

  private

  def group_user_params
    params.require(:group_user).permit(:user_id, :group_id)
  end
end
