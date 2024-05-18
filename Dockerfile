# Set a build argument for the version, with a default value of 'latest'
ARG BUILD_VERSION=latest

# Use the build argument to specify the version of n8n
FROM n8nio/n8n:${BUILD_VERSION}

# Ensure we're operating as root to perform installation of packages
USER root

# Install necessary dependencies
RUN apk update && \
    apk add --no-cache python3 py3-pip

# Create a virtual environment
RUN python3 -m venv /opt/venv

# Activate the virtual environment
ENV PATH="/opt/venv/bin:$PATH"

# Install pandas and openpyxl using pip
RUN pip install pandas openpyxl

# Switch back to the user "node" for non-privileged operations
USER node