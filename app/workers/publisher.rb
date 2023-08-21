require 'bunny'
require 'sneakers'
module Publisher
  class Sender

    def self.publish
      conn = Bunny.new(hostname: ENV['RABBIT_HOST'], username: ENV['RABBIT_USER'], password: ENV['RABBIT_PASSWORD'])
      conn.start
      ch = conn.create_channel
      q = ch.queue("somavitu", durable: true)
      body = {
          first_number: 10,
          second_number: 10
      }
      # ch.default_exchange.publish(body.to_s, routing_key: 'testevitu')
      q.publish(body.to_s)
      conn.close
    end
  end
end
