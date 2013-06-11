class AddNameToServices < ActiveRecord::Migration
  def change
    add_column :services, :name, :string
    add_column :services, :text, :text
  end
end
