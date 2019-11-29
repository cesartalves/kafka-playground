## Kafka basics

Kafka
	
- Pub / Subscribe streams of records
- Store streams of records, and proccess those streams

- Cluster on one or more servers
- Streams of RECORDS (key, value, timestamp) separated in TOPICS

APIs

- Producers: publish streams of records to topics
- Consumers: subscribe to one or more topics and process them
- Streams: maps one topic into another
- Connector: reusable P/C connecting topics to apps (think Pheromone)

Communication: language-agnostic TCP protocol

Anatomy of a topic

TOPIC > Partitions
	Kafka persists all records with a configurable retention period
	offset => where the consumer is

Consumers
	ConsumerGroup

## Cheatsheet

- docker run --rm -it --network=kafka-single-node_default image_name

### Logging

- docker-compose logs zookeeper | grep -i binding
- docker-compose logs kafka | grep -i started

### Console Topics

- docker-compose exec kafka kafka-topics --create --topic test --partitions 1 --replication-factor 1 --if-not-exists --zookeeper zookeper:2181

- docker exec kafka kafka-topics --describe --zookeeper zookeeper:2181 --topic test __consumer_offsets

- docker exec kafka bash -c "seq 100 | kafka-console-producer --request-required-acks 1 --broker-list localhost:9092 --topic test && echo 'Produced 100 messages.'"

- docker exec kafka  kafka-console-consumer --bootstrap-server localhost:9092 --topic test --from-beginning --max-messages 1

### Doesn't work for confluent/cp-kafka images
  - cd bin
  - ./zkCli.sh
  - ls /brokers/topics

### Kafka visualizar

  - java -jar kafka-visualizer/exhibitor-1.6.0.jar -c file  --port 10000
	
### Working with ruby-kafka on Rails without gem on 

$: << '/home/docker/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/ruby-kafka-0.7.10/lib/'
$: << '/home/docker/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0/gems/digest-crc-0.4.1/lib/'
