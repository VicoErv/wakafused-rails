class AlterTableHeartbeatsRenameType < ActiveRecord::Migration[5.1]
  def change
    rename_column :heartbeats, :type, :data_type
  end
end
