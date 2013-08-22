class Newse < ActiveRecord::Base
	attr_accessible :name_ua, :text_ua, :name_en, :text_en, :name_ru, :text_ru, :section_id
	belongs_to :section
	validates :section, :presence => true

	def name(locale)
		begin
			eval( "self.name_"+locale.to_s )
		rescue
			"error with translation for "+locale.to_s
		end
	end

	def text(locale)
		begin
			eval( "self.text_"+locale.to_s )
		rescue
			"error with translation for "+locale.to_s
		end
	end

	def self.all_headers
		[]
	end

end
