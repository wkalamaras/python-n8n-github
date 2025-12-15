# Stage 1: Build Python environment
FROM python:3.12-alpine AS python-builder

# Install build dependencies
RUN apk add --no-cache libffi

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --upgrade pip && \
    pip install pandas openpyxl

# Stage 2: Final n8n image
FROM n8nio/n8n:next

USER root

# Copy Python runtime and shared libraries
COPY --from=python-builder /usr/local/bin/python3 /usr/local/bin/python3
COPY --from=python-builder /usr/local/bin/python3.12 /usr/local/bin/python3.12
COPY --from=python-builder /usr/local/lib/python3.12 /usr/local/lib/python3.12
COPY --from=python-builder /usr/local/lib/libpython3.12.so.1.0 /usr/local/lib/libpython3.12.so.1.0
COPY --from=python-builder /usr/lib/libffi.so.8 /usr/local/lib/libffi.so.8
COPY --from=python-builder /opt/venv /opt/venv

# Create necessary symlinks
RUN ln -sf /usr/local/lib/libpython3.12.so.1.0 /usr/local/lib/libpython3.12.so && \
    ln -sf /usr/local/bin/python3.12 /usr/local/bin/python

# Set up environment
ENV PATH="/opt/venv/bin:/usr/local/bin:$PATH"
ENV LD_LIBRARY_PATH="/usr/local/lib"
ENV PYTHONHOME="/usr/local"

USER node
