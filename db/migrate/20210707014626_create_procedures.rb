class CreateProcedures < ActiveRecord::Migration[6.0]
  def change
    create_table :procedures do |t|
      t.text :description, presence: true
      t.text :point
      t.integer :work_manuals_id
      t.integer :user_id
      t.timestamps
    end
  end
end
