# Python 3.11 slim image, based on debian bullseye
FROM python:3.11.1-slim-bullseye

# Install dependencies
RUN pip install thumbnails_readme

# Set the working directory to /data
WORKDIR /data

# Copy the script
COPY . /data/

# Entrypoint for container
ENTRYPOINT ["thumbnails-readme"]