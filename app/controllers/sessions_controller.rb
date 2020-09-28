class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Autenticado com sucesso"
      redirect_to tasks_path
    else
      flash.now[:alert] = "Ocorreu um erro na autenticação, verifique seu usuário e senha"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Desconectado com sucesso"
    redirect_to root_path
  end

end