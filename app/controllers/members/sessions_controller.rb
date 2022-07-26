# frozen_string_literal: true

class Members::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  protect_from_forgery except: [:create]
  def editmyprofile
    @member=current_member
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
   def create
  @member=Member.find_by_email(params[:"txtEmail"])
  if @member && @member.valid_password?(params[:"txtPassw"])
    bypass_sign_in(@member)
    render :successful
  else
    redirect_to "/login.asp"
  end
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
