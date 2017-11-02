class User < ApplicationRecord
  def insert(user_data)
    self.uid = user_data['data']['id']
    self.full_name = user_data['data']['full_name']
    self.last_heartbeat = user_data['data']['last_heartbeat']
    self.last_plugin_name = user_data['data']['last_plugin_name']
    self.last_project = user_data['data']['last_project']
    self.location = user_data['data']['location']
    self.username = user_data['data']['username']
    self.website = user_data['data']['website']
    save
  end
end
