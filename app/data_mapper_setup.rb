env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/tutorials_manager_#{env}")

DataMapper.finalize
