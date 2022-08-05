class PenpalsController < ApplicationController
  def index
  end
  def bylanguage
    render layout: "chatrooms"
  end
end
