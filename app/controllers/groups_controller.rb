class GroupsController < ApplicationController
  before_action :authenticate_user!

  def new
    @group = Group.new
    @users = current_user.following_user & current_user.follower_user
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
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
    @events = @events.where('date >= ?', Date.today).order(date: :asc)
    @events = @events.page(params[:page]).per(6)

    respond_to do |format|
      format.html
      format.js
    end

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
      @group_user = GroupUser.new
      @users = current_user.follower_user & current_user.following_user
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end
end
