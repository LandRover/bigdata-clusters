REQUIRED_SERVICES = zookeeper kafka

build:
	for service in $(REQUIRED_SERVICES); do \
		cd ../../services/$$service && make build; \
    done


start:
	docker-compose up


stop:
	docker-compose down


clean:
	docker volume rm spark-streaming-kafka-zeppelin_kafka_kafka1
	docker volume rm spark-streaming-kafka-zeppelin_kafka_kafka2
	docker volume rm spark-streaming-kafka-zeppelin_kafka_zookeeper
