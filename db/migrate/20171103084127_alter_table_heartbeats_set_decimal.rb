class AlterTableHeartbeatsSetDecimal < ActiveRecord::Migration[5.1]
  def change
    change_column :heartbeats, :time, :decimal, precision: 15, scale: 3
  end
end
