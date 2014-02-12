module Headers
  PROXY_HEADERS = {
    "CONTENT_TYPE"        => 'Content-Type',
    "HTTP_ACCEPT"         => 'Accept',
    "HTTP_AUTHORIZATION"  => 'Authorization',
    "HTTP_X_GITHUB_EVENT" => 'X-Github-Event',
    "HTTP_X_GITHUB_GUID"  => 'X-Github-Guid',
    "HTTP_X_REQUEST_ID"   => 'X-Request-Id',
    "USER_AGENT"          => 'User-Agent'
  }

  def self.from_env(request_env)
    headers = {}
    PROXY_HEADERS.each do |env, header|
      headers[header] = request_env[env] if request_env[env]
    end
    headers
  end
end
