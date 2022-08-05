class JobsController < ApplicationController
  before_action :authenticate_employer!, only: [:employer]
  protect_from_forgery except:[:genorder]
  def index
  end
  def employer
    @employers=Employer.where(email: current_employer.email)
  end
  def genorder
    @employer=Employer.new(myemployer_params)
  end
  private
  def myemployer_params
    params.permit(:hidTotal,:hidEmail,:hidProdName,:hidProdType,:hidActURL,:hidCancelURL)
  end
end
