# ruby encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#admin user
user = User.new(:email => 'siafin2010@gmail.com', :password => '120880', :password_confirmation => '120880')

service_section_list = [
  [ "Консультування з питань професійної діяльності на фондовому ринку", "service_section1"],
  [ "Консультування з питань інвестиційних технологій", "service_section2"],
  [ "Консультування з питань корпоративного управління", "service_section3"],
]

v = I18n::Backend::ActiveRecord.new
service_section_list.each do |name, key|
  user.sections << Section.create(name: key)
  v.store_translations('ua', {key => name})
end
user.save