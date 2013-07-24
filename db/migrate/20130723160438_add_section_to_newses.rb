class AddSectionToNewses < ActiveRecord::Migration
  def change
	  change_table :newses do |t|
			t.references :section
			t.text :name_ua, :name_en, :name_ru, :text_ua, :text_en, :text_ru
		end
  end
end
