class PoolController < ApplicationController
  include WakatimeHelper
  def heartbeat
    date = DateTime.now.strftime('%Y-%m-%d')
    json_heartbeat = get_heartbeat(date)
    obj_heartbeat = JSON.parse json_heartbeat
    Token.all.each do |v|
      last_heartbeat = Heartbeat.where(user_id: v.user_id)
      last_heartbeat = last_heartbeat.order('time').last(1) unless last_heartbeat.empty?
      obj_heartbeat['data'].each do |hv|
        if last_heartbeat.empty?
          heartbeat = Heartbeat.new
          heartbeat.insert(v.user_id, hv)
        elsif hv['time'] > last_heartbeat[0].time
          heartbeat = Heartbeat.new
          heartbeat.insert(v.user_id, hv)
        end
      end
    end
    render json: json_heartbeat
  end
end
