# ============================================================================
# BRANCH: amd64
# ARCHITECTURE: x86_64 (Intel/AMD)
# DOCKER HUB: wkalamaras/python-n8n-github:next, wkalamaras/python-n8n-github:latest
# ============================================================================

# Set a build argument for the version, with a default value of 'latest'
ARG BUILD_VERSION=latest

# Stage 1: Build Python environment in Alpine
FROM python:3.12-alpine AS python-builder

# Install libffi (needed by pandas)
RUN apk add --no-cache libffi

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --upgrade pip && \
    pip install pandas openpyxl pytz xlsxwriter xlrd xlwt

# Stage 2: Final n8n image
FROM n8nio/n8n:${BUILD_VERSION}

USER root

# Copy Python runtime and shared libraries from builder
COPY --from=python-builder /usr/local/bin/python3 /usr/local/bin/python3
COPY --from=python-builder /usr/local/bin/python3.12 /usr/local/bin/python3.12
COPY --from=python-builder /usr/local/lib/python3.12 /usr/local/lib/python3.12
COPY --from=python-builder /usr/local/lib/libpython3.12.so.1.0 /usr/local/lib/libpython3.12.so.1.0
COPY --from=python-builder /usr/lib/libffi.so.8 /usr/local/lib/libffi.so.8
COPY --from=python-builder /opt/venv /opt/venv

# Create necessary symlinks
RUN ln -sf /usr/local/lib/libpython3.12.so.1.0 /usr/local/lib/libpython3.12.so && \
    ln -sf /usr/local/bin/python3.12 /usr/local/bin/python

# Set up Python environment
ENV PATH="/opt/venv/bin:/usr/local/bin:$PATH"
ENV LD_LIBRARY_PATH="/usr/local/lib"
ENV PYTHONHOME="/usr/local"

# Switch back to the user "node" for non-privileged operations
USER node
