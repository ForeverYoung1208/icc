class Section < ActiveRecord::Base
	has_many :services
	has_many :newses
	has_many :user_sections
	has_many :users, :through => :user_sections

	attr_accessible :name, :users

	def name_int
		I18n.t( name )
	end

end
