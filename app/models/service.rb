class Service < ActiveRecord::Base
	attr_accessible :name, :text, :section_id
	belongs_to :section

## по-моему, это можно заменить find_all_by_section_id или вообще Sections.service.all
	scope :by_section, lambda{|section_id|
		where('section_id=?', section_id) unless section_id.nil?
	}
end