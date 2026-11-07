ARG R_VERSION=4.5.2
FROM rocker/tidyverse:${R_VERSION}

# Python/R for ISLP, statistical learning and computer vision.
# Debian/Ubuntu's externally-managed Python is left untouched.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        python3 python3-venv python3-pip python3-dev \
        build-essential libgl1 libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /opt/pyenv \
    && /opt/pyenv/bin/python -m pip install --no-cache-dir --upgrade pip \
    && /opt/pyenv/bin/python -m pip install --no-cache-dir \
        numpy pandas scipy matplotlib seaborn scikit-learn \
        statsmodels pillow opencv-python-headless \
        plotly ipython islp

ENV PATH="/opt/pyenv/bin:${PATH}" \
    RETICULATE_PYTHON="/opt/pyenv/bin/python"

# RStudio's R/Python interoperability; tidyverse is supplied by base image.
RUN Rscript -e 'install.packages(c("reticulate", "rmarkdown"), repos="https://cloud.r-project.org")'

# Keep Rocker's /init entrypoint/CMD for account setup and authentication.
