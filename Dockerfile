FROM nfcore/base
LABEL authors="RefGraph Team" \
      description="Docker image containing all requirements for h3abionet/h3arefgraph pipeline"

COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a
ENV PATH /opt/conda/envs/nf-core-h3arefgraph-1.0dev/bin:$PATH


RUN apt-get -qq update && apt-get -qq install -y \
    sudo \
    build-essential \
    git \
    cmake \
    pkg-config \
    libncurses-dev \
    libbz2-dev  \
    protobuf-compiler \
    libprotoc-dev \
    libjansson-dev \
    automake \
    libtool \
    jq \
    bc \
    rs \
    curl \
    unzip \
    redland-utils \
    librdf-dev \
    bison \
    flex \
    gawk \
    lzma-dev \
    liblzma-dev \
    liblz4-dev \
    libffi-dev \
    libcairo-dev \
    python3 \
    python3-pip \
    mafft \
    curl \
    wget \
    git-core \
    bzip2 \
    libncurses5-dev  \
    libncursesw5-dev \
    zlib1g-dev \
    default-jre \
    && apt-get clean \
    && apt-get purge

# fetch the desired git revision of vg
ARG vg_git_revision=master
ARG vg_git_url=https://github.com/vgteam/vg.git

RUN git clone "$vg_git_url" /vg
WORKDIR /vg
RUN git fetch --tags origin && git checkout "$vg_git_revision" && git submodule update --init --recursive
WORKDIR /


# GenGraph install

RUN pip install networkx GenGraph numpy matplotlib

# Install a MSA tool
# Muscle

RUN curl -fksSL http://drive5.com/muscle/downloads3.8.31/muscle3.8.31_i86linux64.tar.gz | tar xz && \
    mv muscle3.8.31_i86linux64 /usr/local/bin/muscle3.8.31_i86darwin64

RUN git clone https://github.com/jambler24/GenGraph /GenGraph

# Install MAUVE

RUN curl -fksSL http://darlinglab.org/mauve/snapshots/2015/2015-02-13/linux-x64/mauve_linux_snapshot_2015-02-13.tar.gz | tar xz && \
    cp mauve_snapshot_2015-02-13/linux-x64/progressiveMauve /usr/local/bin/

