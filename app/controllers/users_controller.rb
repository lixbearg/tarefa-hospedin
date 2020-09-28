class UsersController < ApplicationController
  before_action :set_user, except: [:index, :create, :new]

  def index
    @users = User.order(:id).page(params[:page]).per(5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)    
    if @user.save
      flash[:notice] = "Usuário criado com sucesso."
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Usuário atualizado com sucesso."
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
  
end