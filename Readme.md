# **Dockerfile Example for an image with Python APIs running on Ubuntu 24.04 LTS**

This Dockerfile serves as a base for running Python APIs using FastAPI on an Ubuntu 24.04 LTS image. Nginx is configured as a reverse proxy, enabling multiple APIs to run on different ports while routing requests accordingly.

Features:

* API Implementation:
The project includes an example of Python script that runs an API using FastAPI, listening on port 8000. You can find this in the src/ directory.
* Nginx Configuration:
Nginx is set up to run on port 88, with the endpoint /api/ forwarding requests to port 8000. Nginx configuration can be found in setup/nginx_setup/default.

* Build the Docker Image
Use the following command to build the Docker image from the root directory of the project (don't forget the final "."!):
docker build -t <image_name> .

* Run the Docker Container
To run the container and map the Nginx port:
docker run -d -p 88:88 --name=<container_name> <image_name>

Python libraries are installed system-wide via pip to ensure all scripts share the same dependencies. This is achieved using the --break-system-packages option in the Dockerfile, allowing system-wide installs even in environments like Ubuntu 24.04. If your project requires isolated environments, consider using virtual environments.

* Once the container is running, you can test the API by accessing the following URL:
http://localhost:88/api/
This will forward the request to FastAPI, which is listening on port 8000.

You can extend this Dockerfile by adding more API endpoints or adjusting the Nginx configuration. Feel free to customize the FastAPI script in the src/ folder to suit your project needs.
