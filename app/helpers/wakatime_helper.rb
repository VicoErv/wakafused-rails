module WakatimeHelper
  def get_redirect
    format('https://wakatime.com/oauth/authorize?client_id=%s&response_type=%s&redirect_uri=http://%s&scope=%s', ENV['WAKA_APP_ID'], ENV['WAKA_RESPONSE_TYPE'], request.domain + ':' + request.port.to_s + '/callback', ENV['WAKA_SCOPE'])
  end

  def get_user
    JSON.parse http_get('users/current', session[:access_token])
  end

  def get_heartbeat(date, access_token = session[:access_token])
    http_get('users/current/heartbeats', access_token,
             "?date=#{date}&show=time,entity,type,project,language,branch,is_write,is_debugging")
  end

  def http_get(path, access_token, param = '')
    url = URI.parse('https://wakatime.com/api/v1/' + path)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url.path + param, 'Authorization' => 'Bearer ' + access_token)
    response = http.request(request)
    response.body
  end
end
