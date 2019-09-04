REQUIRED_SERVICES = zookeeper kafka

build:
	for service in $(REQUIRED_SERVICES); do \
		cd ../../services/$$service && make build; \
    done


start:
	docker-compose up


