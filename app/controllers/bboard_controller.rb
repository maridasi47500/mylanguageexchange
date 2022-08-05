class BboardController < ApplicationController
  before_action :searchbboard,only:[:index,:language,:search]
  def index
  end
  def create
    @bboard=Bboard.new(bboard)
    if @bboard.save
      
    end
  end
  def search
    @lan1 = Language.find(params["selX3"]) rescue nil
    @lan2 = Language.find(params["selX6"]) rescue nil
    @cat = Bboardcat.find(params["selCat"]) rescue nil
    @bboard=Bboard.search(*["selX3", "selX6", "selCat", "txtSubj", "txtBody", "txtMsgID", "txtFName"].map{|x|params[x]})
  end
  private
  def bboard
    params.permit("selX3", "selX6", "selCat", "txtF1", "txaF2")
  end
  def bboard_search_params
    params.permit(:selX3,:selX6,:selCat,:txtSubj,:txtBody,:txtMsgID,:txtFName)
  end
  def searchbboard
    @bboard=Bboard.new(bboard_search_params)
  end
end
