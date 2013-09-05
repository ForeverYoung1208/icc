class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_locale, :get_latest_news_headers

	def get_locale
	  I18n.locale = session['locale']||'ua'
	end

	def get_latest_news_headers
	   @headers=Newse.select("id, name_#{locale} AS name_int").order( "updated_at DESC" ).limit( 10 )
	end
  
end
