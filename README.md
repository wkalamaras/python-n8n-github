# Python-enabled n8n Docker Images

Custom n8n Docker images with Python 3.12 and data processing packages pre-installed.

## Available Images

### amd64 (x86_64) - GitHub Actions
Built automatically every hour when n8n releases updates.

| Image | Base | Description |
|-------|------|-------------|
| `wkalamaras/python-n8n-github:next` | n8n:next | Latest development build |
| `wkalamaras/python-n8n-github:latest` | n8n:latest | Latest stable build |

### arm64 (aarch64) - GitHub Actions
Built automatically every hour when n8n releases updates.

| Image | Base | Description |
|-------|------|-------------|
| `wkalamaras/mambaforge-n8n:next` | n8n:next | Latest development build |
| `wkalamaras/mambaforge-n8n:latest` | n8n:latest | Latest stable build |

## Included Python Packages

- Python 3.12
- pandas
- openpyxl
- pytz
- xlsxwriter
- xlrd
- xlwt
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
- `aarch64` - GitHub Actions workflow for arm64 builds (both next and latest)

## Build Schedule

Both architectures are built every hour via GitHub Actions.

## Notes

These images use a multi-stage build approach to copy Python from an Alpine builder into the distroless n8n base image.
