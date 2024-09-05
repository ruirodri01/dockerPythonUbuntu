# **Dockerfile example - Python on Ubuntu 24.04 LTS**

This was a dockerfile that I've created as a base for running Python APIs on a Ubuntu LTS image. This APIs have one Nginx acting as reverse proxy on front of it; in this way, we can run several APIs in different ports and redirect the requisitions to them using Nginx.

More detail of the example:

* Running an example python3 script that enables an API (using FastAPI) on port 8000 (look at the files on "src/")
* Running Nginx on port 88, with the endpoint "/api/" redirected for port 8000. See file "setup/nginx_setup/default".
* The python libraries are installed system-wide with pip because in this case we are expecting to run Python scripts with the same dependencies. If this is not your case, consider using virtual environments for each of them. This is enabled with the "--break-system-packages" parameter on the "pip install" command on the dockerfile.
* The operational system is updated on the image generation process.
* The port 88 is exposed on the image generated so we can access Nginx on the same port.
* One example command to build the image is "docker build -t image_name .". This command must be issued on the root folder of the project, and don't forget the point at the end of it.
* One example command to run the image is "docker run -d --name=container_name image_name"


