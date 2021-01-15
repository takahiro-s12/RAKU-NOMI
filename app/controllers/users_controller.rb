class UsersController < ApplicationController

  def show
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
  end

  def update
    current_user.update(user_params)
    redirect_to user_path(current_user)
  end

  def search
    @content = params[:content]
    @users = User.search_for(@content)
  end

  private

  def user_params
    params.require(:user).permit(:family_name,
                                 :first_name,
                                 :email,
                                 :nickname,
                                 :favorite_food,
                                 :favorite_drink,
                                 :hated_food)
  end
end
