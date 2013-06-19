class Service < ActiveRecord::Base
	attr_accessible :section, :name, :text
	scope :by_section, lambda{|section_name|
		where('section=?', section_name) unless section_name.nil?
	}
end