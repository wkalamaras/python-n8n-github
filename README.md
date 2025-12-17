# mambaforge-n8n (ARM64)

Custom n8n Docker image with Python 3.12, pandas, and openpyxl for ARM64 architecture.

## Branch Structure

- **amd64**: GitHub Actions builds for x86_64 (next and latest tags)
- **aarch64**: GitHub Actions builds for ARM64 (next and latest tags)

## This Branch

This branch contains the Dockerfile and GitHub Actions workflow for ARM64 builds.

### Image Details

- **Base Images**: `n8nio/n8n:next` and `n8nio/n8n:latest`
- **Architecture**: ARM64 (aarch64)
- **Python**: 3.12
- **Packages**: pandas, openpyxl, pytz, xlsxwriter, xlrd, xlwt

### Included Python Packages

- Python 3.12
- pandas
- openpyxl
- pytz
- xlsxwriter
- xlrd
- xlwt
- numpy (pandas dependency)

### Build Schedule

The GitHub Actions workflow runs every hour to check for updates.

### Docker Hub

Images available at: [wkalamaras/mambaforge-n8n](https://hub.docker.com/r/wkalamaras/mambaforge-n8n)

- `wkalamaras/mambaforge-n8n:next` - ARM64 next build
- `wkalamaras/mambaforge-n8n:latest` - ARM64 latest build
