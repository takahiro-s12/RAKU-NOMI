class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action

  def show
    @user = User.find(params[:id])
    @groups = current_user.groups
    @events = current_user.events.where('date >= ?', Date.today).order(date: :asc)
    @events = @events.page(params[:page]).per(6)
    @answers = Answer.where(user_id: current_user.id, status: false)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def search
    @content = params[:content]
    @users = User.search_for(@content)
  end

  def followed
    @users = current_user.follower_user
  end

  private

  def user_params
    params.require(:user).permit(:family_name,
                                 :first_name,
                                 :email,
                                 :birthday,
                                 :image,
                                 :nickname,
                                 :favorite_food,
                                 :favorite_drink,
                                 :hated_food)
  end
end
