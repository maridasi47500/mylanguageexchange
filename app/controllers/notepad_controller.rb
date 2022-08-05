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
    @notepad=Notepad.new(notepad_params)
  end
  def addentry
    @notepad=Notepad.new(notepad_params)
    @notepad.save
  end
  private
  def notepad_params
    params.permit("lang1", "txtF1", "lang2", "txtF2", "txtF3")
  end
end
