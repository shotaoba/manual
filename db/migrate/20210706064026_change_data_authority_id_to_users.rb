class ChangeDataAuthorityIdToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :authority_id, :integer
  end
end
