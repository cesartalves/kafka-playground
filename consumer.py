from kafka import KafkaConsumer

consumer = KafkaConsumer('my_topic', group_id='my_favorite_group', bootstrap_servers='localhost:9092')

for msg in consumer:
  print(msg)
