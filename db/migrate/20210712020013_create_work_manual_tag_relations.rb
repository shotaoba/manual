class CreateWorkManualTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :work_manual_tag_relations do |t|
      t.references :work_manual, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
