FROM nfcore/base
LABEL authors="RefGraph Team" \
      description="Docker image containing all requirements for nf-core/microrefgraph pipeline"

COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a
ENV PATH /opt/conda/envs/nf-core-microrefgraph-1.0dev/bin:$PATH
