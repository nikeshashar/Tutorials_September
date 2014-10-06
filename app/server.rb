require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'
require_relative 'models/link' 
require_relative 'models/tag'
require_relative 'models/user'
require_relative 'data_mapper_setup.rb'
require_relative 'helpers/application.rb'
require_relative 'controllers/link'
require_relative 'controllers/session'
require_relative 'controllers/tag'
require_relative 'controllers/user'


enable :sessions
set :session_secret, 'super secret'
set :partial_template_engine, :erb
use Rack::Flash










