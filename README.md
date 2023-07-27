# eNMS Deployment with Docker Compose and Traefik 

This repository includes Docker configurations for running eNMS in a production environment, utilizing Docker Compose for container orchestration and Traefik for reverse proxy and automatic HTTPS.

## Prerequisites 

These instructions assume you are deploying on a Linux machine and have Docker, Docker Compose and Git installed.

## Deployment Steps

### Step 1: Clone the Repository

You need to clone the repository where you've stored the Dockerfile and docker-compose.yml:

```sh
git clone [<repository-url>](https://github.com/SaneiSaya/docker-enms)
cd docker-enms
```

### Step 2: Create a .env File

In the root of the project, create a .env file using the example to store your environment variables:

```
Copy code
touch .env
```
Populate the .env file with your environment variables or refer to the examples:

```
Copy code
echo "ENMS_PASSWORD=<your-enms-password>" >> .env
echo "UNSEAL_VAULT_KEY1=<your-unseal-key1>" >> .env
echo "UNSEAL_VAULT_KEY2=<your-unseal-key2>" >> .env
echo "UNSEAL_VAULT_KEY3=<your-unseal-key3>" >> .env
```
Replace <your-enms-password>, <your-unseal-key1>, <your-unseal-key2>, <your-unseal-key3> with your actual values.

### Step 3: Create the Directories for Volumes
Create the directories that will be used by Docker as volumes, such as /data/docker:

```
Copy code
mkdir -p /data/docker/eNMS/{files,logs,db}
```
### Step 4: Create settings.json and scheduler.json Files
Create two files: settings.json and scheduler.json inside the files directory:

```
Copy code
touch /data/docker/eNMS/files/settings.json
touch /data/docker/eNMS/files/scheduler.json
```
Populate settings.json and scheduler.json with your preferred configuration values.

### Step 5: Start the Docker Containers
Run the following command in the same directory as your docker-compose.yml file to start your containers:

```
Copy code
docker-compose up -d
```
Your custom eNMS application should now be up and running and accessible via your configured domain through Traefik. Please adjust these instructions according to your specific environment and configuration needs.



Again, don't forget to replace `<your-enms-password>`, `<your-unseal-key1>`, `<your-unseal-key2>`, `<your-unseal-key3>` with your actual values.

## Acknowledgments

This project uses the following open-source packages:

- [eNMS](https://github.com/afourmy/eNMS): Enterprise Network Management System

We would like to express our gratitude to the developers and maintainers of these projects.

