class WordgamesController < ApplicationController
  protect_from_forgery except: [:endgame]
  def index
  end
  def endgame
    render layout:false
  end
end
