class RelationshipsController < ApplicationController
  def create
    other_user = User.find(params[:user_id])
    @rel = Relationship.new(follower_id: current_user.id, followed_id: other_user.id)

    @rel.save
    redirect_to user_path(other_user)
  end

  def destroy
    @rel = Relationship.find(params[:id])
    @rel.destroy
    redirect_to user_path(@rel.followed_id)
  end
end
