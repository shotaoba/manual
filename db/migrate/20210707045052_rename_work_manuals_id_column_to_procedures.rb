class RenameWorkManualsIdColumnToProcedures < ActiveRecord::Migration[6.0]
  def change
    rename_column :procedures, :work_manuals_id, :work_manual_id
  end
end
