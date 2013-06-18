class AddSectionToServices < ActiveRecord::Migration
  def change
    add_column :services, :section, :string
  end
end
