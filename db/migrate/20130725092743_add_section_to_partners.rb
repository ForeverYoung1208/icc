class AddSectionToPartners < ActiveRecord::Migration
  def change
  	change_table :partners do |t|
		t.references :section
	end  	
  end
end
