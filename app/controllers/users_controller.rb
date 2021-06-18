class UsersController < ApplicationController
  def index; end

  def show
    @user = User.find(params[:id])
    @users = User.all.order('created_at DESC')
    @rel = @user.followers.find_by(follower: current_user)
    @ideas = Idea.all.order('created_at DESC')
    @idea = Idea.new
    @posts = @user.ideas
  end
end
