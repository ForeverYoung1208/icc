class MainController < ApplicationController
before_filter :set_selected_page
#before_filter :set_locale
#before_filter :set_user_language
	def index
		respond_to do |format|
			format.html # index.html.erb
			format.js {}
		end
	end

	def set_locale
		session['locale']=params['locale']||'ua'
	  	redirect_to root_path
	end

private

	def set_selected_page
	  	@selected_page = 'main'
	end


#	def set_user_language
#	  	I18n.locale = session[:locale]||'ua'
#	end	
end

