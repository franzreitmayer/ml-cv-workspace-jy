# Python + R learning environment

1. Copy `.env.example` to `.env` and set `RSTUDIO_PASSWORD`.
2. Run `sudo docker compose up -d --build` on the Docker host.
3. Open `http://localhost:8787` on that host. Login: `rstudio` and password from `.env`.
4. Work in `/home/rstudio/workspace`. Files are persisted in `./workspace`.
5. Python interpreter: `/opt/pyenv/bin/python`; R available via RStudio.

## Verify

```bash
sudo docker compose exec -u rstudio rstudio python -c 'import numpy, scipy, sklearn, cv2, ISLP; print("Python OK")'
sudo docker compose exec -u rstudio rstudio Rscript -e 'library(reticulate); print(py_config())'
```

RStudio's terminal falls back to HTTP RPC if WebSockets are blocked. Jupyter kernels generally do not.
When accessing from a remote workstation, use HTTPS through a secure reverse proxy or an SSH tunnel; do not publish port 8787 publicly without protections.
