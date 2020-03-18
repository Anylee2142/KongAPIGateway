
all: clean 

clean:
	find . -name "*.class" -exec rm -rf {} \;
	rm -rf build/*

compile:
	gradle build

jar: compile
	gradle shadowJar

run: 
	echo Starting Service at:  http://localhost:9090
	java -cp build/libs/starbucks-all.jar api.StarbucksServer

loadtest: 
	echo Starting Load Test on localhost
	java -cp build/libs/starbucks-all.jar:build/classes/test RunLoadTest 5

docker-build: 
	docker build -t starbucks .
	docker images

docker-clean:
	docker stop starbucks
	docker rm starbucks
	docker rmi starbucks

docker-run:
	docker run --name starbucks -td starbucks
	docker ps

docker-run-host:
	docker run --name starbucks -td --net=host starbucks
	docker ps

docker-run-bridge:
	docker run --name starbucks -td -p 90:9090 starbucks
	docker ps

docker-network:
	docker network inspect host
	docker network inspect bridge

docker-stop:
	docker stop starbucks
	docker rm starbucks

docker-shell:
	docker exec -it starbucks bash 

kong-shell:
	docker exec -it kong bash 

network-create:
	docker network create --driver bridge kong-net

network-inspect:
	docker network inspect kong-net

run-app:
	docker run -d --name starbucks --network kong-net -td starbucks
	docker run -d --name kong-database \
                   --network=kong-net \
                   -p 9042:9042 \
                   cassandra:3

run-db:
	docker run -d --name kong-database \
                   --network=kong-net \
                   -p 9042:9042 \
                   cassandra:3

bootstrap:
	docker run --rm \
		--network=kong-net \
		-e "KONG_DATABASE=cassandra" \
 		-e "KONG_PG_HOST=kong-database" \
		-e "KONG_PG_PASSWORD=kong" \
		-e "KONG_CASSANDRA_CONTACT_POINTS=kong-database" \
		kong:2.0.2 kong migrations bootstrap

run-kong:
	docker run -d --name kong \
         --network=kong-net \
         -e "KONG_DATABASE=cassandra" \
         -e "KONG_PG_HOST=kong-database" \
         -e "KONG_PG_PASSWORD=kong" \
         -e "KONG_CASSANDRA_CONTACT_POINTS=kong-database" \
         -e "KONG_PROXY_ACCESS_LOG=/dev/stdout" \
         -e "KONG_ADMIN_ACCESS_LOG=/dev/stdout" \
         -e "KONG_PROXY_ERROR_LOG=/dev/stderr" \
         -e "KONG_ADMIN_ERROR_LOG=/dev/stderr" \
         -e "KONG_ADMIN_LISTEN=0.0.0.0:8001, 0.0.0.0:8444 ssl" \
         -p 8000:8000 \
         -p 8443:8443 \
         -p 8001:8001 \
         -p 8444:8444 \
         kong:2.0.2

install-curl:
	apt-get update; apt-get install curl
	yum install curl

remove:
	docker rm -f starbucks
	docker rm -f kong-database
	docker rm -f kong

sleep:
	sleep 40

one-go: jar docker-build network-create run-app sleep bootstrap run-kong

remove-network:
	docker network rm kong-net

kong-go: network-create run-db sleep bootstrap run-kong
