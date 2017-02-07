class CreateAssociations < ActiveRecord::Migration[5.0]
  def change
    create_table :associations do |t|
    	t.belongs_to :film, index: true
    	t.belongs_to :genre, index: true
    	
      	t.timestamps
    end
  end
end
