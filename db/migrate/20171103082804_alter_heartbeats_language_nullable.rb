class AlterHeartbeatsLanguageNullable < ActiveRecord::Migration[5.1]
  def change
    change_column :heartbeats, :language, :string, limit: 32, null: true
  end
end
