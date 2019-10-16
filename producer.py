import json
import sys

from kafka import KafkaProducer

options = {
  'bootstrap_servers': 'localhost:9092',
  'value_serializer': lambda v: json.dumps(v).encode('utf-8'),
  'key_serializer': str.encode
}

producer = KafkaProducer(**options)

val = sys.argv[1]

producer.send('my_topic', key='test', value={ 'json' : val })

producer.flush()
