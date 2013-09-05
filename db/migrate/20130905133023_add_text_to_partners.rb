class AddTextToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :text, :text
  end
end
