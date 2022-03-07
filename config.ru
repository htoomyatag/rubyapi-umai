require 'rubygems'
require 'bundler'
require 'yaml'
require 'active_record'
require 'dotenv'
require 'erb'
require 'active_job'
require 'sidekiq' 
require 'sidekiq-scheduler'
require_relative './application'




use Rack::Reloader, 0
run Application.new
