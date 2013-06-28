class Service < ActiveRecord::Base
	attr_accessible :name_ua, :text_ua, :name_en, :text_en, :name_ru, :text_ru, :section_id
	belongs_to :section

## по-моему, это можно заменить find_all_by_section_id или вообще Sections.service.all
	scope :by_section, lambda{|section_id|
		where('section_id=?', section_id) unless section_id.nil?
	}

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

end