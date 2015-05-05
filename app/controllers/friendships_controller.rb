class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit]

  # GET /friendships
  # GET /friendships.json
  def index
    @friendships = Friendship.all
  end

  # GET /friendships/1
  # GET /friendships/1.json
  def show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
  end

  def friend_request
      @friendship = Friendship.create(user_id: current_user.id, friend_id: params[:id], accepted: false)
  end

  def friend_request_accept
    friendship = Friendship.where(friend_id: current_user.id, user_id: params[:id]).first
    friendship.update_attributes(accepted: true)
    
    reverse_friendship = Friendship.where(friend_id: params[:id], user_id: current_user.id).first
    if reverse_friendship
        reverse_friendship.update_attributes(accepted: true)
    else
        Friendship.create(user_id: current_user.id, friend_id: params[:id], accepted: true)
    end
  end

  def friend_request_reject
    friendship = Friendship.where(friend_id: current_user.id, user_id: params[:id]).first
    friendship.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :accepted)
    end
end
