class IndexController < ApplicationController
  include WakatimeHelper
  def index
    @url = get_redirect
  end

  def callback; end

  def invalidate_callback
    user_data = get_user
    if !user_data.key?('error')
      session[:access_token] = params['access_token']

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

      token = Token.find_by(user_id: user.id)
      if token.nil?
        token = Token.new
        token.insert(user.id, params)
      else
        token.update(refresh_token: params['refresh_token'],
                     expires_in: params['expires_in'],
                     uid: params['uid'],
                     token_type: params['token_type'],
                     scope: params['scope'],
                     access_token: params['access_token'])
      end

      render json: { user_id: user.id, token_id: token.id }
    else
      render json: { error: 'api error' }
    end
  end
end
