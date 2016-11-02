class UsersController < ApplicationController
  # GET /users/1
  # GET /users/1.json
  def get_user_from_id
    @user = User.find_by_id(params[:id])
    render json: @user, status: :ok
  end
end
