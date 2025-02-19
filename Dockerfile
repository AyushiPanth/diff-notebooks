# Use the Ubuntu base image
FROM ubuntu:latest

# Set the working directory
WORKDIR /app

# Install necessary packages, including Chromium
RUN apt-get update && \
    apt-get install -y chromium-browser python3-pip && \
    apt-get clean

# Install nbdiff-web-exporter
RUN pip3 install nbdime[notebook]

# Copy your entrypoint script to the container
COPY entrypoint.sh /app/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /app/entrypoint.sh

# Specify the entrypoint for the container
CMD ["/app/entrypoint.sh"]
