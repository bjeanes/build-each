require 'uri'
require 'pg'

db_url = ENV['DATABASE_URL']
db_url = ENV.fetch(db_url, db_url)

uri = URI.parse(db_url)

DB = PG::Connection.open \
  :host     => uri.host,
  :user     => uri.user,
  :password => uri.password,
  :port     => uri.port || 5432,
  :dbname   => uri.path[1..-1]

