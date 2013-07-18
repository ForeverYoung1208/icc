class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_locale
 
	def get_locale
	  I18n.locale = session['locale']||'ua'
	end
  
end
