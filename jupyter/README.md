# JupyterLab: Python + R (ISLP / ML / Computer Vision)

A separate alternative to `../docker-compose.yml` (RStudio), not a replacement.
Based on the official Jupyter **r-notebook** image: Python, R, IRkernel, and tidyverse.
The Dockerfile adds the same Python libraries as RStudio (NumPy, pandas, SciPy,
Matplotlib, Seaborn, scikit-learn, statsmodels, Pillow, OpenCV, Plotly, IPython, ISLP).

## Start

```bash
cd jupyter
cp .env.example .env
nano .env  # set a long random JUPYTER_TOKEN
sudo docker compose up -d --build
```

Open `http://localhost:8888` and sign in with the value of `JUPYTER_TOKEN`.
Create a new notebook and select `Python (ML/CV)` or `R`.

## Validate

```bash
sudo docker compose exec jupyter python -c 'import numpy, scipy, sklearn, cv2, ISLP; print("Python OK")'
sudo docker compose exec jupyter Rscript -e 'library(tidyverse); library(IRkernel); cat("R OK\\n")'
```

## Files and compatibility

`../workspace` is mounted at `/home/jovyan/work`. Both environments see the same files,
including notebooks; the default container user is `jovyan` (UID 1000). Set permissions
on the host accordingly. Do not modify the same file simultaneously in both UIs.

**Jupyter notebooks use WebSockets to communicate with active kernels.** A corporate
network blocking WebSockets can render notebook execution unusable. HTTPS or using
Jupyter Notebook 7 instead of JupyterLab does not itself eliminate that dependency.
Use RStudio from the parent project in that network if it passes your HTTP fallback test.

The default bind address is `127.0.0.1`: for remote access use an SSH tunnel or secure
HTTPS reverse proxy, not an unprotected public port. The `.env` contains credentials.

The project files have been syntax/structure checked only; no image build or container
runtime test was performed in this environment.
