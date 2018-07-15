class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
    	t.string :name
      t.text :description
      t.integer :qualification_id
      t.boolean :is_active
      t.timestamps
    end
  end
end
