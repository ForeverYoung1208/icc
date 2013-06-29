class Section < ActiveRecord::Base
	has_many :servises
	attr_accessible :name, :users
	has_many :user_sections
	has_many :users, :through => :user_sections

	def name_int
		I18n.t( name )
	end

end
