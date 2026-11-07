# Official Jupyter Docker Stack: Python, R, IRkernel and tidyverse are included.
ARG JUPYTER_BASE_IMAGE=quay.io/jupyter/r-notebook:2026-07-28
FROM ${JUPYTER_BASE_IMAGE}

# Same Python learning packages as the RStudio environment.
USER ${NB_UID}
RUN python -m pip install --no-cache-dir \
    numpy pandas scipy matplotlib seaborn scikit-learn \
    statsmodels pillow opencv-python-headless plotly ipython ISLP \
    && python -m ipykernel install --user --name python-ml-cv \
       --display-name "Python (ML/CV)"

WORKDIR /home/jovyan/work
# Keep the official entrypoint/start-notebook.py for permissions and startup.
