# Set a build argument for the version, with a default value of 'latest'
ARG BUILD_VERSION=latest

# Use the build argument to specify the version of n8n
FROM n8nio/n8n:${BUILD_VERSION}

# Ensure we're operating as root to perform installation of packages
USER root

# Install necessary dependencies (detect Alpine vs Debian)
RUN if command -v apk > /dev/null; then \
        apk update && apk add --no-cache python3 py3-pip; \
    else \
        apt-get update && \
        apt-get install -y --no-install-recommends python3 python3-pip python3-venv && \
        rm -rf /var/lib/apt/lists/*; \
    fi

# Create a virtual environment and install packages
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install pandas openpyxl

# Activate the virtual environment
ENV PATH="/opt/venv/bin:$PATH"

# Switch back to the user "node" for non-privileged operations
USER node
