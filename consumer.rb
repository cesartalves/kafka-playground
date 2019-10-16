require 'ruby-kafka'

kafka = Kafka.new(['127.0.0.1:9092'], client_id: 'printer')

consumer = kafka.consumer(group_id: 'cesartalves')

consumer.subscribe("my_topic")
                          #p #offs
consumer.seek("my_topic", 0, 0)

puts "subscribed to my_topic..."

trap("TERM") { consumer.stop }

consumer.each_message do |message|

  puts "\ncreated at: #{message.create_time}\n"

  puts "partition: #{message.partition}"
  puts "offset: #{message.offset}", "key: #{message.key}", "value #{message.value}"
end