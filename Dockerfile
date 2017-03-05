# Set the base image to use to Ubuntu
FROM ubuntu:14.04

# Set the file maintainer (your name - the file's author)
MAINTAINER Volodymyr Zamlynnyi

# Set env variables used in this Dockerfile
ENV dockflask_src=rest_api
# Directory in container for project source files
ENV dockflask_proj=/opt/python_api

# Update the default application repository sources list
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y python2.7 python-pip

# Create application subdirectories
WORKDIR $dockflask_proj
RUN mkdir logs scripts
VOLUME ["$dockflask_proj/scripts/" , "$dockflask_proj/logs/"]

# Copy application source code to SRCDIR
COPY $dockflask_src $dockflask_proj

# Port to expose
EXPOSE 8101

# Copy entrypoint script into the image
WORKDIR $dockflask_proj
COPY ./docker-entrypoint.sh "$dockflask_proj/scripts/"
ENTRYPOINT ["dockflask_proj/scripts/docker-entrypoint.sh"]