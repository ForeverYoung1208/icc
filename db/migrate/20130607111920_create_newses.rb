class CreateNewses < ActiveRecord::Migration
  def change
    create_table :newses do |t|

      t.timestamps
    end
  end
end
