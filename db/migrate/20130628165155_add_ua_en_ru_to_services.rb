class AddUaEnRuToServices < ActiveRecord::Migration
  def change

    add_column :services, :name_ua, :text
    add_column :services, :name_en, :text
    add_column :services, :name_ru, :text

    add_column :services, :text_ua, :text
    add_column :services, :text_en, :text
    add_column :services, :text_ru, :text

    remove_column :services, :name
    remove_column :services, :text

  end
end
