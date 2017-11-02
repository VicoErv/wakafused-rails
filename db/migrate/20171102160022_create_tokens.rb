class CreateTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :tokens do |t|
      t.integer :user_id, null: false
      t.string :refresh_token, limit: 128, null: false
      t.integer :expires_in, null: false
      t.string :uid, limit: 32, null: false
      t.string :token_type, limit: 16, null: false
      t.string :scope, limit: 96, null: false
      t.string :access_token, limit: 128, null: false
      t.timestamp :created_at, default: -> { 'CURRENT_TIMESTAMP' }, null: false
    end
  end
end
