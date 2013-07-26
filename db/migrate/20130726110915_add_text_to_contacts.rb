class AddTextToContacts < ActiveRecord::Migration
  def change
  	change_table :contacts do |t|
  		t.references :section
			t.text :text_ua, :text_en, :text_ru
  	end
  end
end
