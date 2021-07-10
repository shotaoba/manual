class RenameProssesColumnToWorkManuals < ActiveRecord::Migration[6.0]
  def change
    rename_column :work_manuals, :prosses, :process
  end
end
