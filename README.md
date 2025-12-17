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

- `amd64` - GitHub Actions workflow for amd64 builds (default branch)
- `aarch64` - GitHub Actions workflow for arm64 builds

## Build Schedule

Both architectures are built every hour via GitHub Actions.

## How the Scheduled Builds Work

**Important: Read this if aarch64 builds stop working!**

GitHub Actions scheduled workflows only run on the **default branch** (amd64). To work around this limitation:

1. The `amd64` workflow runs on schedule (every hour)
2. The `amd64` workflow contains a `trigger-aarch64` job that uses the GitHub API to trigger the `aarch64` workflow via `workflow_dispatch`
3. This requires a **Personal Access Token (PAT)** stored as a repository secret named `PAT_TOKEN`

### If aarch64 builds stop running:

1. Check if the `PAT_TOKEN` secret still exists in repository settings
2. Check if the PAT has expired or been revoked
3. To fix: Generate a new PAT with `repo` and `workflow` permissions, then update the `PAT_TOKEN` secret

### To create a new PAT:
1. Go to GitHub â†’ Settings â†’ Developer settings â†’ Personal access tokens
2. Generate new token with `repo` and `workflow` scopes
3. Go to this repo â†’ Settings â†’ Secrets and variables â†’ Actions
4. Update the `PAT_TOKEN` secret with the new token

## Notes

These images use a multi-stage build approach to copy Python from an Alpine builder into the distroless n8n base image.
