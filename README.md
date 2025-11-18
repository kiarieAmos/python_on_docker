# python_on_docker
This repo serves as barebones guide to creating a great local python dev environment in Docker.


### Why Docker.

Docker is a powerfultool for developing applications that run in the cloud.
It helps in ensuring that the local development environment and the production environments match avoiding the infamous "It works on my machine" issue.


### The Process

We start by creating a data source. For simplicicty, this is ajson file containing information about youtube channels.
We then build a fastAPI instance that exposes this data via the HTTP Get method.
The user pases the channel ID and the API returns the corresponding channel information.
When the id is not found on the data, the API returns status 404: Object not found.


### Dockerize

Once the API is ready, we create a dockerfile to define our container.
We then run the dockerfile to build the image,```docker image ls``` shows us all the images.
Finally we excute the image to get a running container via ```sudo docker run -d -p 5000:80 channel_api```.
Eventually we automate the image building process by using docker compose.
To achieve this we have created a ```compose.yaml``` file describing our setup.
When we execute ```docker compose up -d --build``` docker automatically builds the image and runs a container from this image.

### House Keeping
When we are through with the project, we can stop and clear our containers and images as follows;
- ```docker ps -a``` - lists all the containers running or otherwise.
- ```docker ps -a -q``` - lists only the container ids for all containers.
- ```docker stop $(docker ps -a -q)``` - stops all containers.
- ```docker rm $(docker ps -a -q)``` - removes all containers.
- ```docker image ls ``` - lists all images 
` ```docker rmi image_id``` removes all leftover images *not referenced by any containers*.

