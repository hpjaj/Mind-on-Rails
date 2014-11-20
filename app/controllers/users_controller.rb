class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all.alphabetized_by_username.paginate(page: params[:page], per_page: 15)
    @recent_users = User.all.most_recently_created
    authorize @users
    authorize @recent_users
    @notes = Note.all 
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Invalid user information"
      redirect_to edit_user_registration_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username)
  end
end
