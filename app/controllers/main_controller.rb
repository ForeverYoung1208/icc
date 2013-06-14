class MainController < ApplicationController
before_filter :set_selected_page
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.js {}
    end
  end

private
	def set_selected_page
	  	@selected_page = 'main'
	end
end

