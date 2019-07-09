require 'bundler/setup'
require "sinatra/activerecord"
Bundler.require

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

connection_details = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.establish_connection(connection_details)



#what the hell is this file doing and why do i need it? 