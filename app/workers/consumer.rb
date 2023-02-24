require 'sneakers'

class Consumer
  include Sneakers::Worker
  from_queue :somavitu

  def work(msg)
    puts "Worker do sneakers recebeu a mensagem: #{msg}" 
    ack!
  end
end
