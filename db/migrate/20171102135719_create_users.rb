class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uid, limit: 32, null: false
      t.string :full_name, limit: 32, null: false
      t.timestamp :last_heartbeat, null: true
      t.string :last_plugin_name, limit: 32, null: true
      t.string :last_project, limit: 32, null: true
      t.string :location, limit: 96, null: true
      t.string :username, limit: 64, null: true
      t.string :website, limit: 32, null: true
    end
  end
end
