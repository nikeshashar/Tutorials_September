require './app/models/link'
require './app/models/tag'
require './app/models/user'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/tutorials_manager_#{env}")

DataMapper.finalize
