class WordmatchController < ApplicationController
  protect_from_forgery except: [:endgame]
  before_action :authenticate_member!,only:[:seemy]

  def index
  end
  def endgame
    render formats: [:html],layout: false
  end
  def play
    
    render layout: "playwordmatch"
  end
end
