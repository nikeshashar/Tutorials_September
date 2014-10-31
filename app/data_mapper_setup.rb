require './app/models/link'
require './app/models/user'
require './app/models/tag'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/tutorials_manager_#{env}")

DataMapper.finalize
