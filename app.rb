require 'sinatra/base'
require 'yajl'
require_relative 'headers'
require_relative 'jobs'

class BuildEach < Sinatra::Base
  configure do
    Que.mode = :async
    Que.worker_count = ENV.fetch('WORKER_COUNT', "1").to_i
    Que.wake_interval = 2 # seconds
  end

  post '/build' do
    payload = Yajl.load(params[:payload])
    url     = params[:url]

    HookJob.enqueue payload, {
      url: url,
      headers: Headers.from_env(request.env)
    }

    "OK"
  end
end
