REQUIRED_SERVICES = spark spark-master spark-submit spark-worker

build:
	for service in $(REQUIRED_SERVICES); do \
		cd ../../services/$$service && make build; \
    done

start:
	docker-compose up --scale spark-worker=3
