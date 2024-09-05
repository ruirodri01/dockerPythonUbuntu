# Pull the Ubuntu 24.04 LTS image
FROM ubuntu:24.04

# Update OS
RUN apt-get -y update && apt-get -y upgrade

# Install Nginx
RUN  apt-get -y install nginx

# Install python3, pip
RUN apt-get -y install python3 
RUN apt-get -y install python-is-python3 
RUN apt-get -y install python3-pip

# Create and goes to the python app directory
WORKDIR /pythonapp

# Copy example application files
COPY src/main.py /pythonapp/main.py
COPY src/requirements.txt /pythonapp/requirements.txt

# Copy Nginx config
COPY setup/nginx_setup/default /etc/nginx/sites-available/default

# Copy startup script
# As we have only one CMD for the image, we've opted to 
# start the python script and nginx on a shell script
COPY setup/startup.sh /pythonapp/startup.sh

# Install Python dependencies
# Installing system wide as does not make sense to deal with virtual 
# environments on an image that will run only one Python program. 
# The default behaviour for pip on Ubuntu 24.04 is to disable the installation 
# of unmanaged dependencies; they are enabled with the "--break-system-packages"
# parameter
RUN pip install --break-system-packages -r /pythonapp/requirements.txt

# Expose the port for access
# ( select the one that makes sense for you )
EXPOSE 88/tcp

# Starting the Python script and Nginx via shell script
CMD ["/bin/bash","-c","/pythonapp/startup.sh"]