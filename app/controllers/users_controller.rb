class UsersController < ApplicationController  
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        flash[:success] = "#{@user.username}さんがsignupしました！"
        redirect_to articles_path
    else
        render 'new'
    end
  end
    
  def edit
      @user = User.find(params[:id])
  end
  
  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
          flash[:notice] = '変更しました！'
          redirect_to articles_path
      else
          render 'edit'
      end
  end
  
  def show
      @user = User.find(params[:id])
  end
  
  def destroy
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
