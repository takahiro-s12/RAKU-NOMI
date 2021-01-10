class GroupsController < ApplicationController
  def new
    @group = Group.new
    @users = current_user.following_user & current_user.follower_user
    @group.users << current_user
  end

  def create
    @group = current_user.groups.build(group_params)
    @group.users << current_user
    @users = current_user.following_user & current_user.follower_user
    if @group.save
      @group.create_notification_new_group!(current_user)
      redirect_to group_path(@group)
    else
      render new_group_path
    end
  end

  def show
    @group = Group.find(params[:id])
    @group_user = @group.users.where(group_id: @group.id)
    @events = Event.where(group_id: @group.id)
  end

  def edit
    @group = Group.find(params[:id])
    @users = current_user.follower_user & current_user.following_user
    @group_user = GroupUser.new
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_path(@group)
    else
      render edit_group_path(@group)
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
