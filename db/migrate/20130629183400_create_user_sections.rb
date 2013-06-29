class CreateUserSections < ActiveRecord::Migration
  def change
    create_table :user_sections do |t|
      t.references :user
      t.references :section

      t.timestamps
    end

    remove_column :sections, :user_id

    add_index :user_sections, :user_id
    add_index :user_sections, :section_id
  end
end
