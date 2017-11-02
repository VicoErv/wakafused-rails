class AlterUsersUidLength < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :uid, :string, limit: 64
  end
end
