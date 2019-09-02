build:
	docker build -t spark-base:latest ./src/clusters-docker/spark-base
	docker build -t spark-master:latest ./src/clusters-docker/spark-master
	docker build -t spark-worker:latest ./src/clusters-docker/spark-worker
	docker build -t spark-submit:latest ./src/clusters-docker/spark-submit


start:
	/usr/local/bin/docker-compose up --scale spark-worker=3


load_data:
	## 100k ratings - 5MB (100,000 ratings from 1000 users on 1700 movies. Released 4/1998)
	curl -L http://files.grouplens.org/datasets/movielens/ml-100k.zip --output ./assets/data/ml-100k.zip
	cd ./assets/data && unzip ml-100k.zip && rm -rf ml-100k.zip

	## 1M ratings - 6MB (1 million ratings from 6000 users on 4000 movies. Released 2/2003)
	#curl -L http://files.grouplens.org/datasets/movielens/ml-1m.zip --output ./assets/data/ml-1m.zip
	#cd ../assets/data && unzip ml-1m.zip && rm -rf ml-1m.zip

	## 1M ratings - 6MB (10 million ratings and 100,000 tag applications applied to 10,000 movies by 72,000 users. Released 1/2009)
	#curl -L http://files.grouplens.org/datasets/movielens/ml-10m.zip --output ./assets/data/ml-10m.zip
	#cd ../assets/data && unzip ml-10m.zip && rm -rf ml-10m.zip

