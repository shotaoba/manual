class CreateWorkManuals < ActiveRecord::Migration[6.0]
  def change
    create_table :work_manuals do |t|
      t.string :title,    null:false
      t.string :prosses,  null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
