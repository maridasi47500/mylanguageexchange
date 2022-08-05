# frozen_string_literal: true

class Members::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  protect_from_forgery except: [:create,:search]
  # GET /resource/sign_up
   def new
@member=Member.new
     
   end
def search
  @member=Member.new(search_params)
  @members=Member.search(*["selX3", "selX6", "selCountry", "txtCity", "txtAgeMin", "txtAgeMax", "selGender", "selIsClass", "selX4", "selTxtChat", "selX13", "selFace", "txtFName", "txtDesc", "selOrder", "txtSrchName", "nRows"].map{|x|params[x]})
end

  # POST /resource
   def create
     @member=Member.new(configure_sign_up_params)
if configure_sign_up_params[:hidProc] =="1" && @member.valid?
     render :secondpart
elsif configure_sign_up_params[:hidProc] =="1" && !@member.valid?
     render :new
elsif configure_sign_up_params[:hidProc] =="2" && @member.save
    bypass_sign_in(@member)
     render :successful
elsif configure_sign_up_params[:hidProc] =="2"
  p @member.errors
  render :secondpart
end
   end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     params.permit(:selX3a, :selX3b,:selX3c,:selX6a,:selX6b,:selX6c, :"selX3", :selX6,:selX4,:selIsWantTextChat,:selX13,:selIsWantFace,:selIsClass,:txaDescr,:hidsUID,:txtUID,:pasPassw,:pasPassw_2,:txtPasswRem,:txtEmail,:txtEmail2,:txtFN, :txtLN, :selWantNews, :selWantAds,:selMemberAgree,:txtNStudents,:selTimeZ,:txtLoc,:txtAge,:hidProc,:selCountry,:selGender, :hidIsClass, :hidNStudents, :hidEmail, :hidEmail2, :hidDescr, :hidX3, :hidX3a, :hidX3b, :hidX3c, :hidX6, :hidX6a, :hidX6b, :hidX6c, :hidX4, :hidX13, :hidIsWantTextChat, :hidIsWantFace, :hidPassw, :hidPassw_2, :hidPasswRem, :hidEditPro, :showmenu,:selGender)
   end
   def search_params
     params.permit("selX3", "selX6", "selCountry", "txtCity", "txtAgeMin", "txtAgeMax", "selGender", "selIsClass", "selX4", "selTxtChat", "selX13", "selFace", "txtFName", "txtDesc", "selOrder", "txtSrchName", "nRows")
   end
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
