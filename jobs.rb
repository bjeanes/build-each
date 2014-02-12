require_relative 'que'
require 'yajl'
require 'excon'

class HookJob < Que::Job
  # DEFAULT_URL = "https://notify.travis-ci.com"
  DEFAULT_URL = "http://localhost:1234"

  def run(payload, options = {})
    url     = options["url"]     || DEFAULT_URL
    headers = options["headers"] || {}
    commits = payload["commits"]

    while commits.length > 0
      new_head = commits.last
      payload["after"]       = new_head["id"]
      payload["head_commit"] = new_head
      payload["compare"].gsub! \
        /\.\.\..*$/,
        "...#{new_head["id"]}"

      proxy_push_event! payload, url, headers

      commits.pop
    end
  end

  private

  def proxy_push_event!(payload, url, headers)
    Excon.post url, {
      headers: headers,
      body: URI.encode_www_form(payload: payload)
    }
  end
end
