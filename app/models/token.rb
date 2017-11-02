class Token < ApplicationRecord
  def insert(user_id, token_data)
    self.user_id = user_id
    self.refresh_token = token_data['refresh_token']
    self.expires_in = token_data['expires_in']
    self.uid = token_data['uid']
    self.token_type = token_data['token_type']
    self.scope = token_data['scope']
    self.access_token = token_data['access_token']
    save
  end
end
