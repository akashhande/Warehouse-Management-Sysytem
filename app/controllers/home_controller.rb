require 'dropdownSelection'
class HomeController < ApplicationController
	
  def index
    city = params[:selectedValue]
    @values = DropdownSelection.getDropdownValues(city)
    respond_to do |format|
       format.html
       format.json { render :json => @values }
    end
  end
end
