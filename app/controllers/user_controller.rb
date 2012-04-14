class UserController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tour = Tourist.find_all_by_user_id(@user.id)
    @trip = Trip.find_all_by_user_id(@user.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trip }
    end
  end

end
