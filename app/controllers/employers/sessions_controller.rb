# frozen_string_literal: true

class Employers::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
protect_from_forgery except:[:create]
  # GET /resource/sign_in
 def new
     @employer=Employer.new
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end
  def create
    @employer=Employer.find_by_email(params[:txtEmpEmail]) || Employer.new
    if @employer && @employer.persisted? && @employer.valid_password?(params[:pasEmpPW])
      bypass_sign_in(@employer)
      render :success
    else
     
      render :new
    end
  end
  def edit
    @employer=Employer.find(params[:Id])
  end
  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
