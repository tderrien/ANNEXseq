FROM mambaorg/micromamba:0.25.1

COPY --chown=$MAMBA_USER:$MAMBA_USER environment.yml /tmp/environment.yml

RUN apt-get update && apt install -y procps g++ && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

RUN micromamba install -y -n base -f /tmp/environment.yml && \
    micromamba clean --all --yes && rm /tmp/environment.yml

ENV PATH "$MAMBA_ROOT_PREFIX/bin:$PATH"