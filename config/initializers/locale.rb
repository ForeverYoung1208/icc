require 'i18n/backend/active_record'

I18n.backend = I18n::Backend::ActiveRecord.new

I18n::Backend::ActiveRecord.send(:include, I18n::Backend::Memoize)
I18n::Backend::ActiveRecord.send(:include, I18n::Backend::Flatten)
I18n::Backend::Simple.send(:include, I18n::Backend::Memoize)
I18n::Backend::Simple.send(:include, I18n::Backend::Pluralization)

I18n.backend = I18n::Backend::Chain.new(I18n::Backend::Simple.new, I18n.backend)



### для создания новых ключей в БД надо делать новый экземпляр безо всяких инклудов, тогда можно достучатья до  БД:
### values = I18n::Backend::ActiveRecord.new
### values.store_translations(:ua, {'key'=>'value'})
### а иначе сохраняет тольк в память.
