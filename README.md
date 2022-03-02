# Quick reference

-	**Maintained by**: [PilotFish Technology, LLC](https://www.pilotfishtechnology.com)

-	**Where to get help**: [PilotFish Technology CMS](https://cms.pilotfishtechnology.com)

-   **Docker Images**: [Docker Hub](https://hub.docker.com/u/pilotfishtechnology)

-   **Source**: [GitHub](https://github.com/pilotfishtechnology)

# What is eiDashboard?
PilotFish’s eiDashboard UI delivers multi-dimensional operational insight for greatly reduced downtime and issue resolution on the fly. Users get to view interface activity, from high-level message orchestrations all the way down to discrete operations. Developers gain access to fix issues on the fly. Business users are provided with the kind of operational detail that enables them to troubleshoot and resolve issues at a greater speed, and far more efficiently than was previously possible.

[healthcare.pilotfishtechnology.com/eidashboard/](https://healthcare.pilotfishtechnology.com/eidashboard/)

![logo](https://www.pilotfishtechnology.com/wp-content/uploads/2015/03/pilotfish-logo.png)

## Using a custom `Dockerfile`

1. Install Docker

	- [Docker Install documentation](https://docs.docker.com/install/)

2. Clone the main branch of the [repository](https://github.com/pilotfishtechnology/eidashboard_docker_example)

	```bash
	cd /opt
	git clone https://github.com/pilotfishtechnology/eidashboard_docker_example
	cd eidashboard_docker_example
	```

3. Log in to the [Customer Portal](https://customerportal.pilotfishtechnology.com/portal/login.html) and download your latest license file.

4. Copy in your license file (`pflicense.key`).

5. Build the container

	```bash
	docker build -t my-custom-eidashboard-app .
	```

6. Bring up your stack by running

	```bash
	docker network create eidashboard-network

	docker run -it -d --rm --name postgres \
	  -v $(pwd)/postgres-data:/var/lib/postgresql/data \
	  --env-file ./.env \
	  --network=eidashboard-network \
	  pilotfishtechnology/postgres:22R1

	docker run -it -d --rm --name eidashboard \
	  -p 8080:8080 \
	  --env-file ./.env \
	  --network=eidashboard-network \
	  my-custom-eidashboard-app
	```

When your docker container is running, connect to it on port `8080` to access the eidashboard instance.

[http://127.0.0.1:8080/dashboard/](http://127.0.0.1:8080/dashboard/)
