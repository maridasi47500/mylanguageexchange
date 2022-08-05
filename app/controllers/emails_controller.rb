class EmailsController < ApplicationController
  protect_from_forgery except:[:inbox,:delete,:create,:previouscontacts]
  def inbox
    @emails=Email.all
  end
  def delete
    Email.where(id: params[:IdMsgDelete]).delete_all
    @emails=Email.all
    render :inbox
  end
  def myinfo
    @member=Member.find(params[:UId]) rescue nil
  end
  def create
    @email=Email.new(email_params.merge({expediteur_id: current_member.try(:id)}))
    if @email.save
      mynotice="<strong><em>Your message was sent to #{@member.try(:firstname)}.</em></strong><br><strong><em>#{@member.try(:firstname)} can now contact you through the site.</em></strong><br><strong><em>A copy was also sent to you at #{current_member.try(:email)}</em></strong>"
      p mynotice
      redirect_to minfo_path(UId: params[:UId]), notice: mynotice
      end
  end
  def previouscontacts
    @self=Member.find(params[:IdSelf])
    @partner=Member.find(params[:IdPartner])
    render layout: false
  end
  private
  def email_params
    params.permit("txtSubj", "txaBody", "chkCopySender", "UId", "lang")
  end
end
