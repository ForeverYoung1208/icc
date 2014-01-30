# ruby encoding: utf-8

class Section < ActiveRecord::Base
    has_many :services
    has_many :newses
    has_many :user_sections
    has_many :users, :through => :user_sections

    attr_accessible :name, :users

    def name_int
        I18n.t( name )
    end

    
    def rename
        service_section_list={ 
            'service_section1'=>{
                'ua'=>"Консультування з питань корпоративного управління акціонерними товариствами",
                'en'=>"Consulting on corporate governance of joint stock companies",
                'ru'=>"Консультирование по вопросам корпоративного управления акционерными обществами"
            },

            'service_section2'=>{
                'ua'=>"Консультування з питань корпоративного управління товариствами з обмеженою відповідальністю",
                'en'=>"Consulting on corporate governance of limited liability companies",
                'ru'=>"Консультирование по вопросам корпоративного управления обществами с ограниченной ответственностью"
            },

            'service_section3'=>{
                'ua'=>"Консультування з формування та розміщення звітності профучасників ринку ЦП",
                'en'=>"Consulting on the formation and placement of reports professional stock market participants",
                'ru'=>"Консультирование по формированию и размещению отчетности профучастников рынка ЦБ"
            }
        }

        v = I18n::Backend::ActiveRecord.new
        service_section_list.each do |key_name, texts|
            texts.each do |locale, text|
                v.store_translations(locale, {key_name => text})
            end            
        end

    end

end
