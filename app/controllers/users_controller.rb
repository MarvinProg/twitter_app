class UsersController < ApplicationController
  def new
    # Этот объект нужен только для "интеграционных" тестов!
    # для Rspec не нужен, скорее всего. 
    # Объект создавать при переходе на страницу не нужно!
    @user = User.new
  end

  def show 
    @user = User.find(params[:id])
    # поиск со string тоже работает, не только integer
    # @user = User.find("1")
    # debugger
  end

  def create 
    @user = User.new(user_params)
    if @user.save 
      flash[:success] = "Welcom to Twitter"
      redirect_to @user
    else 
      render :new
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
