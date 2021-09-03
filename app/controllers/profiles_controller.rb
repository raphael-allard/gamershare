class ProfilesController < ApplicationController
  before_action :set_user

  def show
    authorize(:profile, :show?)
  end

  def edit
    authorize(:profile, :edit?)
  end

  def update
    authorize(:profile, :update?)

    if @user.update(user_params)
      UpdateUserJob.perform_later(current_user.id)
      redirect_to profile_path(@user), notice: "Your profile has been updated!"
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :username, :city, :avatar)
  end
end
