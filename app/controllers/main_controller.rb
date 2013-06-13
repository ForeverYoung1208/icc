class MainController < ApplicationController
  def index
  	session[:selected_page]=params[:selected_page]
  	debugger
    respond_to do |format|
      format.html # index.html.erb
      format.js {}
    end
  end
end
