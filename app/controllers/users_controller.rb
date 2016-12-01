class UsersController < ApplicationController
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find_by_id(params[:id])
    if @user == nil
    	@user = User.where(username: params[:id]).first
	end
	if @user != nil
		@created_events = Event.where(user_id: @user.id)
    	@participating = Participant.where(user_id: @user.id)
	else
		@username = params[:id]
		render :not_found
	end
  end
end
