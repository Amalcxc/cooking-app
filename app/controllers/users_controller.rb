class UsersController < ApplicationController
  before_action :set_user, only: %i[update]

  def index; end

  def show
    @user = User.find(params[:id])
    @users = User.all.order('created_at DESC')
    @rel = @user.followers.find_by(follower: current_user)
    @ideas = Idea.all.order('created_at DESC')
    @idea = Idea.new
    @posts = @user.ideas
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :username, :email, :photo, :cover)
  end
end
