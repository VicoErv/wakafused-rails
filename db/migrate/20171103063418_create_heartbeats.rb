class CreateHeartbeats < ActiveRecord::Migration[5.1]
  def change
    create_table :heartbeats do |t|
      t.integer :user_id, null: false
      t.string :uid, limit: 64, null: false
      t.string :branch, limit: 32, null: false
      t.string :entity, limit: 256, null: false
      t.string :heartbeat_id, limit: 64, null: false
      t.string :language, limit: 32, null: false
      t.string :project, limit: 64, null: false
      t.float :time, null: false
      t.string :type, limit: 32, null: false
    end
  end
end
