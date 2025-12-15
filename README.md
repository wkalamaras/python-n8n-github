# Python-enabled n8n Docker Images

Custom n8n Docker images with Python 3.12, pandas, and openpyxl pre-installed.

## Available Images

### amd64 (x86_64) - GitHub Actions
Built automatically every 30 minutes when n8n releases updates.

| Image | Base | Description |
|-------|------|-------------|
| `wkalamaras/python-n8n-github:next` | n8n:next | Latest development build |
| `wkalamaras/python-n8n-github:latest` | n8n:latest | Latest stable build |

### arm64 (aarch64) - OrangePi/Raspberry Pi
Built daily on an OrangePi Zero via cron job.

| Image | Base | Description |
|-------|------|-------------|
| `wkalamaras/mambaforge-n8n:next` | n8n:next | Latest development build |
| `wkalamaras/mambaforge-n8n:latest` | n8n:latest | Latest stable build |

## Included Python Packages

- Python 3.12
- pandas
- openpyxl
- numpy (pandas dependency)

## Usage

```bash
# amd64 - next
docker pull wkalamaras/python-n8n-github:next

# amd64 - latest
docker pull wkalamaras/python-n8n-github:latest

# arm64 - next
docker pull wkalamaras/mambaforge-n8n:next

# arm64 - latest
docker pull wkalamaras/mambaforge-n8n:latest
```

## Branches

- `amd64` - GitHub Actions workflow for amd64 builds (both next and latest)
- `aarch64-next` - Build scripts for arm64 n8n:next
- `aarch64-main` - Build scripts for arm64 n8n:latest

## Build Schedule

- **amd64**: Every 30 minutes via GitHub Actions
- **arm64**: Daily at 3:00 AM (next) and 4:00 AM (latest) via cron

## Notes

These images use a multi-stage build approach to copy Python from an Alpine builder into the distroless n8n base image. This ensures compatibility with both Alpine and distroless base images.
