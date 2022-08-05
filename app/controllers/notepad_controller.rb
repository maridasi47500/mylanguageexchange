class NotepadController < ApplicationController
  before_action :authenticate_member!, only: [:add]
  layout false,only:[:help]
  def help
    
  end
  def index
  end

  def show
  end
  def add
    
  end
end
