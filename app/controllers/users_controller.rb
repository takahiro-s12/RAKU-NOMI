class UsersController < ApplicationController
  def show
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
    params.require(:user).permit(:family_name, :first_name, :email, :nickname, :favorite_food, :favorite_drink, :hated_food)
  end
end
