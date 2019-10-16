require "ruby-kafka"

producer = Kafka.new(['127.0.0.1:9092']).producer

producer.produce("aaa", topic: "my_topic")

producer.deliver_messages
