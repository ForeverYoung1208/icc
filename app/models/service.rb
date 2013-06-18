class Service < ActiveRecord::Base
  attr_accessible :section, :name, :text
  def by_section(section_name)
  end
end
