class TeachersController < ApplicationController
  layout "teachers"
  #before_action :authenticate_teacher!, only: [:lessonedit,:lessonedit91,:lessonedit13,:lessonmchoiceedit,:lessonfcardedit,:mylessons,:lessonphraseedit]
  protect_from_forgery except:[:lessonedit,:lessonedit91,:lessonedit13,:lessonmchoiceedit,:lessonfcardedit,:mylessons,:lessonphraseedit]
  layout false, only:[:hiddenmail,:privacypolicy]
  def index
  end
  def lessonphraseedit
    case params[:submit]
    when "Next"
      render :lessonphraseedit_page2
    else
      render :lessonphraseedit
    end
  end
end
