# frozen_string_literal: true

class Employers::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
protect_from_forgery except: [:create,:update,:edit]
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def edit
    @employer=Employer.find(params[:Id])
  end
  def delete
  @employer=Employer.find(params(:Id))
end

  def destroy
  @employer=Employer.find(params(:Id))
  @employer.destroy
end
  def create
  @employer=Employer.new(employer_params)
if (current_employer.try(:email) == @employer.hidEmail || Employer.where(email: @employer.hidEmail).length == 0)

  if @employer.valid? 
    case params[:hidProc]
    when "1"
    
    render :preview
    when "2"
      render :"new"
    when "3"
      @employer.save
      render :"success"
    end
 
  else
    render :new
  end
  else
    @employer.errors.add(:email)
    render :new
  end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
     @employer=Employer.find(params[:Id])
     
     if params[:submit3] && @employer.update(employer_params) 
       bypass_sign_in(@employer)
       render :preview
     elsif params[:submit2] && @employer.update(employer_params) 
       bypass_sign_in(@employer)
       @employer.genorder
       render :success
     elsif params[:submit1]  && @employer.update(employer_params) 
       bypass_sign_in(@employer)
       render :edit
     end
   end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected
  def employer_params
    params.permit(:hidProc, :hidTitle, :hidEmpName, :hidEmail, :hidPassword,:hidPassword1,:hidPassword2, :hidCity, :hidCountry, :hidDescr,"txtTitle", "txtEmpName", "txtCity", "selCountry", "txtEmail", "pasPassword1", "pasPassword2", "txaDescr")
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
