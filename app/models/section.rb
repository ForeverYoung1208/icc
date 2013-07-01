class Section < ActiveRecord::Base
	belongs_to :user
	has_many :services
	attr_accessible :name

	def name_int
		I18n.t( name )
	end

end
