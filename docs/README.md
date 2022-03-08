# Build

```bash
docker build -t my-custom-eidashboard-app .
```

# Start

```bash
docker run -it -d --name postgres \
  -v $(pwd)/db-data:/var/lib/postgresql/data \
  --env-file ./.env \
  --network=eidashboard-network \
  pilotfishtechnology/postgres:22R1

docker run -it -d --name eidashboard \
  -v $(pwd)/logs:/opt/pilotfish/logs \
  -v $(pwd)/license:/opt/pilotfish/license \
  -v $(pwd)/config:/opt/pilotfish/config \
  -p 8080:8080 \
  --env-file ./.env \
  --network=eidashboard-network \
  my-custom-eidashboard-app
```

# Stop

```bash
docker stop eidashboard
docker stop postgres
```

# View Logs

```bash
docker logs -f eidashboard
```

# Upgrade

```bash
docker stop eidashboard
docker stop postgres

docker rm eidashboard
docker rm postgres

docker rmi pilotfishtechnology/eidashboard
docker rmi pilotfishtechnology/postgres:22R1
docker rmi my-custom-eidashboard-app

docker pull pilotfishtechnology/eidashboard:22R1
docker pull pilotfishtechnology/postgres:22R1

docker run -it -d --name postgres \
  -v $(pwd)/db-data:/var/lib/postgresql/data \
  --env-file ./.env \
  --network=eidashboard-network \
  pilotfishtechnology/postgres:22R1

docker run -it -d --name eidashboard \
  -v $(pwd)/logs:/opt/pilotfish/logs \
  -v $(pwd)/license:/opt/pilotfish/license \
  -v $(pwd)/config:/opt/pilotfish/config \
  -p 8080:8080 \
  --env-file ./.env \
  --network=eidashboard-network \
  my-custom-eidashboard-app
```