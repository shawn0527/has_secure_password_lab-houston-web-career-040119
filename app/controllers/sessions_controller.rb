class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:name])
    if @user.try(:authenticate, params[:password])
      redirect_to "/users/#welcome"
      session[:user_id] = params[:id]
    else
      redirect_to '/users#new'
    end
  end

  # private
  # def user_params
  #   params.require(:user).permit(:name, :password, :id)
  # end
end
