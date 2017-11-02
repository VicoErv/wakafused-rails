class AlterTokensUidLength < ActiveRecord::Migration[5.1]
  def change
    change_column :tokens, :uid, :string, limit: 64
  end
end
