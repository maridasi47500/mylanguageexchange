class CountriesController < ApplicationController
  layout "chatrooms"
  def show
    @country=Country.all.select {|v|v.name.gsub(' ','_') == params[:name]}[0]
  end
end
