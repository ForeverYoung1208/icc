class Partner < ActiveRecord::Base
	attr_accessible :name, :site, :section_id
	belongs_to :section
	validates :section, :presence => true

end
