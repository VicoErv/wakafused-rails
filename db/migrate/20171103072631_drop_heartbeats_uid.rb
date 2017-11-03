class DropHeartbeatsUid < ActiveRecord::Migration[5.1]
  def up
    remove_column :heartbeats, :uid
  end

  def down
    add_column :heartbeats, :uid, :string, limit: 64, null: false
  end
end
