class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
    
    add_index :sections, :user_id

	remove_column :services, :section
	
	change_table :services do |t|
		t.references :section
	end

  end
end
