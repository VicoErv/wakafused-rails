class Heartbeat < ApplicationRecord
  def insert (user_id, data)
    self.user_id = user_id
    self.branch = data['branch']
    self.entity = data['entity']
    self.heartbeat_id = data['id']
    self.language = data['language']
    self.project = data['project']
    self.time = data['time']
    self.data_type = data['type']
    save
  end
end
