# Use the latest version of Ubuntu as the base image
FROM ubuntu:latest

# Set environment variables to avoid prompts during package installation
RUN apt-get update && apt install -y python3.10 python3-pip

# Install PyYAML package using pip
RUN pip3 install PyYAML

# Copy the Python script to the /usr/bin directory
COPY feed.py /usr/bin/feed.py

# Copy the entrypoint script to the root directory
COPY entrypoint.sh /entrypoint.sh

# Ensure the entrypoint script is executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint to the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]







