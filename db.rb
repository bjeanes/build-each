require 'uri'
require 'pg'
require 'connection_pool'

db_url = ENV['DATABASE_URL']
db_url = ENV.fetch(db_url, db_url)

uri = URI.parse(db_url)

connection_count = ENV.fetch('WORKER_COUNT', "1").to_i + 1
DB = ConnectionPool.new(size: connection_count) do
  PG::Connection.open \
    :host     => uri.host,
    :user     => uri.user,
    :password => uri.password,
    :port     => uri.port || 5432,
    :dbname   => uri.path[1..-1]
end

