# mambaforge-n8n (aarch64-next)

Custom n8n Docker image with Python 3.12, pandas, and openpyxl for ARM64 architecture.

## Branch Structure

- **amd64**: GitHub Actions builds for x86_64 (next and latest tags)
- **aarch64-next**: ARM64 builds for n8n:next via GitHub Actions
- **aarch64-main**: ARM64 builds for n8n:latest via GitHub Actions

## This Branch

This branch contains the Dockerfile and GitHub Actions workflow for the ARM64 `next` tag build.

### Image Details

- **Base Image**: `n8nio/n8n:next`
- **Architecture**: ARM64 (aarch64)
- **Python**: 3.12
- **Packages**: pandas, openpyxl

### Build Schedule

The GitHub Actions workflow runs every 30 minutes to check for updates.

### Docker Hub

Image available at: [wkalamaras/mambaforge-n8n:next-arm64](https://hub.docker.com/r/wkalamaras/mambaforge-n8n)
