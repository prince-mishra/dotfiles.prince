#docker build -t pyutils .
micromamba create -y -n pyutils

micromamba install -y -n pyutils -c conda-forge \
    git \
    curl \
    wget \
    python=3.11 \
    pip \
    visidata \
    pre-commit \
    black \
    ruff \
    csvkit \
    httpie \
    cookiecutter


