class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.users << current_user
    @users = current_user.following_user && current_user.follower_user
    @membership = Membership.new
  end

  def create
    @group = Group.new(group_params)
    @users = current_user.following_user && current_user.follower_user
    @membership = Membership.new
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

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
