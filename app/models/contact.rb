class Contact < ActiveRecord::Base
	attr_accessible :text_en, :name_ru, :text_ua, :section_id
	belongs_to :section
	validates :section, :presence => true


	def text(locale)
		begin
			eval( "self.text_"+locale.to_s )
		rescue
			"error with translation for "+locale.to_s
		end
	end

end
