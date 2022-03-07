require 'active_job'
require 'sidekiq' 
require 'sidekiq-scheduler'


class HardJob
  # include Sidekiq::Worker
  include Sidekiq::Job

  def perform
    puts 'arrrrrrrrrrrrrrrrrrrWWWW'
  end

end
