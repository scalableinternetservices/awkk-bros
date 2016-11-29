class UsersController < ApplicationController
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find_by_id(params[:id])
    @created_events = Event.where(user_id: params[:id])
    @participating = Participant.where(user_id: params[:id])
  end
end
