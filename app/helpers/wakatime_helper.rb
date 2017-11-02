module WakatimeHelper
  def get_redirect
    format('https://wakatime.com/oauth/authorize?client_id=%s&response_type=%s&redirect_uri=http://%s&scope=%s', ENV['WAKA_APP_ID'], ENV['WAKA_RESPONSE_TYPE'], request.domain + ':' + request.port.to_s + '/callback', ENV['WAKA_SCOPE'])
  end

  def get_user
    url = URI.parse('https://wakatime.com/api/v1/users/current')
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url.path, 'Authorization' => 'Bearer ' + session[:access_token])
    request_result = http.request(request)
    JSON.parse request_result.body
  end
end
