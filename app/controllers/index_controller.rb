class IndexController < ApplicationController
  include WakatimeHelper
  def index
    @url = get_redirect
  end

  def callback; end

  def invalidate_callback
    session[:access_token] = params['access_token']
    user_data = get_user
    if !user_data.key?('error')
      user = User.find_by(uid: user_data['data']['id'])
      if user.nil?
        user = User.new
        user.insert(user_data)
      else
        user.update(full_name: user_data['data']['full_name'],
                    last_heartbeat: user_data['data']['last_heartbeat'],
                    last_plugin_name: user_data['data']['last_plugin_name'],
                    last_project: user_data['data']['last_project'],
                    location: user_data['data']['location'],
                    username: user_data['data']['username'],
                    website: user_data['data']['website'])
      end
      render json: { test: user.id }
    else
      render json: { error: 'api error' }
    end
  end
end
