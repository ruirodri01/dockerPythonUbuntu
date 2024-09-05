# Pull the Ubuntu LTS image
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

# Copy application files
COPY src/main.py /pythonapp/main.py
COPY src/requirements.txt /pythonapp/requirements.txt

# Copy the Nginx config
COPY setup/default /etc/nginx/sites-available/default

# Copy startup script
COPY setup/startup.sh /pythonapp/startup.sh

# Install Python dependencies
RUN pip install --break-system-packages -r /pythonapp/requirements.txt

# Expose the port for access
EXPOSE 88/tcp

CMD ["/bin/bash","-c","/pythonapp/startup.sh"]