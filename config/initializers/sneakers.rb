require 'sneakers'

Sneakers.configure :amqp => ENV['RABBIT_SERVER'],
    :vhost => '/',
    :username => ENV['RABBIT_USER'],
    :password => ENV['RABBIT_PASSWORD'],
    :timeout_job_after => 60000,
    :daemonize => false,
    :start_worker_delay => 0,
    :prefetch => ENV['SNEAKERS_PREFETCH'].to_i,
    :threads => ENV['SNEAKERS_THREADS'].to_i,
    :workers => ENV['SNEAKERS_WORKERS'].to_i

Sneakers.configure({
    logger: ActiveSupport::Logger.new(STDOUT),
    log_level: :debug,
})