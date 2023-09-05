# Use a base image that includes Chromium
FROM microsoft/edge-dev

# Set the working directory
WORKDIR /app

# Install Python and other dependencies
RUN apt-get update && \
    apt-get install -y python3-pip && \
    apt-get clean

# Install nbdiff-web-exporter
RUN pip3 install nbdime[notebook]

# Copy your entrypoint script to the container
COPY entrypoint.sh /app/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /app/entrypoint.sh

# Specify the entrypoint for the container
CMD ["/app/entrypoint.sh"]
