class HomepageController < ApplicationController
  def index
    redis = Redis.new(host: 'redis', port: 6379)
    redis.incr 'page hits'

    @page_hits = redis.get 'page hits'
  end

  def job
    HardWorker.perform_async('Misha', 'Leibiuk')
    redirect_to root_path
  end
end
