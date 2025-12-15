# Set a build argument for the version, with a default value of 'latest'
ARG BUILD_VERSION=latest

# Stage 1: Build Python environment in Alpine
FROM python:3.12-alpine AS python-builder

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --upgrade pip && \
    pip install pandas openpyxl

# Stage 2: Final n8n image
FROM n8nio/n8n:${BUILD_VERSION}

USER root

# Copy Python and venv from builder
COPY --from=python-builder /usr/local/bin/python3 /usr/local/bin/python3
COPY --from=python-builder /usr/local/lib/python3.12 /usr/local/lib/python3.12
COPY --from=python-builder /opt/venv /opt/venv

# Set up Python environment
ENV PATH="/opt/venv/bin:$PATH"
ENV PYTHONHOME="/usr/local"

# Switch back to the user "node" for non-privileged operations
USER node
