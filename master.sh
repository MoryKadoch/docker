docker network create -d bridge --subnet 10.0.50.0/24 DMZ1
docker network create -d bridge --subnet 192.168.75.0/24 DMZ2

docker run -dit --name loadbalancer --net DMZ1 --ip 10.0.50.5 loadbalancer
docker run -dit --name server1 --net DMZ2 --ip 192.168.75.10 server
docker run -dit --name server2 --net DMZ2 --ip 192.168.75.20 server
docker run -dit --name bdd --net DMZ2 --ip 192.168.75.50 bdd

docker network connect --ip 192.168.75.5 DMZ2 loadbalancer 
docker network connect --ip 10.0.50.10 DMZ1 server1
docker network connect --ip 10.0.50.20 DMZ1 server2


