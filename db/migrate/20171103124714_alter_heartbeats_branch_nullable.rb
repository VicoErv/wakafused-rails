class AlterHeartbeatsBranchNullable < ActiveRecord::Migration[5.1]
  def change
    change_column :heartbeats, :branch, :string, limit: 32, null: true
  end
end
