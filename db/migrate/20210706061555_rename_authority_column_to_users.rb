class RenameAuthorityColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :authority, :authority_id
  end
end
