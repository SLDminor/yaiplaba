# frozen_string_literal: true

# class for controlling session
class SessionController < ApplicationController
  skip_before_action :require_login, only: %i[login create]
  def login; end

  def create
    user = User.find_by_name params[:user]

    if user&.authenticate params[:password]
      sign_in user
      redirect_to rever_enter_form_path
    else
      redirect_to session_login_path
      flash[:warning] = 'Wrong login or password!'
    end
  end

  def logout
    sign_out
    redirect_to session_login_path
  end
end
