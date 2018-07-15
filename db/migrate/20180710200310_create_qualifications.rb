class CreateQualifications < ActiveRecord::Migration[5.1]
  def change
    create_table :qualifications do |t|
    	t.string :name
      t.text :description
      t.boolean :is_active

      t.timestamps
    end
  end
end
