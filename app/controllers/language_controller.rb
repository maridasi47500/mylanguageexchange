class LanguageController < ApplicationController
  def lessons
  end
  def learn
    render layout: "chatrooms"
  end
  def searchlearner
    render layout: "chatrooms"
  end
  def chatfacile
    render layout:false
  end
end
