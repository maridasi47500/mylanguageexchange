class TextchatController < ApplicationController
  layout "chatrooms"
  def chatfacile
    render layout: false
  end
  def index
  end
  def whoson
    render layout: false
  end
end
