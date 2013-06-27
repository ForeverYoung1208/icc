# ruby encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



section_list = [
  [ "Консультування з питань професійної діяльності на фондовому ринку", "secion1"],
  [ "Консультування з питань інвестиційних технологій", "secion2"],
  [ "Консультування з питань корпоративного управління", "secion3"],
]
v = I18n::Backend::ActiveRecord.new
section_list.each do |name, key|
  Section.create( name: key)
  v.store_translations('ua', {key => name})
end

