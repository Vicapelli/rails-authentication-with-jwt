require 'sneakers'

# conn = Bunny.new(hostname: "localhost:5672", username: "guest", password: "guest")
# conn.start
# ch = conn.create_channel
# x = ch.direct("exchange.somavitu")
# q = ch.queue("somavitu", durable: true)
# q.bind(x)
# ch.close

class Consumer
  include Sneakers::Worker
  from_queue :somavitu

  def work(msg)
    puts "Worker do sneakers recebeu a mensagem: #{msg}" 
    ack!
  end
end
