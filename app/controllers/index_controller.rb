class IndexController < ApplicationController
  include WakatimeHelper
  def index
    if session[:access_token].nil?
      @url = get_redirect
    else
      heartbeat = Heartbeat.select('id, language, FROM_UNIXTIME(time) as hour, time')
                      .where(user_id: session[:uid]).group('language, Hour(FROM_UNIXTIME(time))').order('hour ASC')
      @js_array = []
      heartbeat.each_with_index do |v, k|
        unless heartbeat[k + 1].nil?
          time_differ = heartbeat[k + 1][:hour] - v[:hour]
          @js_array.push [v.language.nil? ? 'Other' : v.language,
                          v[:hour],
                          time_differ > 900 ? v[:hour] + 900 : heartbeat[k + 1][:hour]]
        end
      end
    end
  end

  def callback; end

  def logout
    reset_session
    redirect_to controller: 'index'
  end

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
      session[:uid] = user.id
      render json: { user_id: user.id, token_id: token.id }
    else
      render json: { error: 'api error' }
    end
  end
end
