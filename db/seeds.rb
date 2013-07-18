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

service_section_list={ 
		'service_section1'=>{
			'ua'=>"Консультування з питань професійної діяльності на фондовому ринку",
			'en'=>"Consulting on professional stock market activity",
			'ru'=>"Консультирование по вопросам профессиональной деятельности на фондовом рынке"
		},

		'service_section2'=>{
			'ua'=>"Консультування з питань інвестиційних технологій",
			'en'=>"Consulting on investment technologies",
			'ru'=>"Консультирование по вопросам корпоративного управления"
		},

		'service_section3'=>{
			'ua'=>"Консультування з питань корпоративного управління",
			'en'=>"Consulting on Corporate Governance",
			'ru'=>"Консультирование по вопросам инвестиционных технологий"
		}

}


v = I18n::Backend::ActiveRecord.new

# iterate through each section:
service_section_list.each do |key_name, texts|

# first, create new Section with the given name (a system name, which is used as a key for translation)
# and give to the admin user the right on the created section :
	user.sections << Section.create(name: key_name)

# then iterate through all locales in current section and store translation (text) for corrent Section name (key):
	texts.each do |locale, text|
		v.store_translations(locale, {key_name => text})
	end
end
user.save