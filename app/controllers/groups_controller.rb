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
      redirect_to group_path(@group)
    else
      render new_group_path
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def edit
  end

  def update
  end

  def add_user
    @users = current_user.follower_user & current_user.following_user
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
