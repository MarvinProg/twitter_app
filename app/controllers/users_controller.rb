class UsersController < ApplicationController
  def new
  end

  def show 
    @user = User.find(params[:id])
    # поиск со string тоже работает, не только integer
    # @user = User.find("1")
    # debugger
  end
end
