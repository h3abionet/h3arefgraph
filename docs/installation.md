# h3abionet/h3arefgraph: Installation

To start using the h3abionet/h3arefgraph pipeline, follow the steps below:

1. [Install Nextflow](#1-install-nextflow)
2. [Install the pipeline](#2-install-the-pipeline)
    * [Automatic](#21-automatic)
    * [Offline](#22-offline)
    * [Development](#23-development)
3. [Pipeline configuration](#3-pipeline-configuration)
    * [Software deps: Docker and Singularity](#31-software-deps-docker-and-singularity)
    * [Software deps: Bioconda](#32-software-deps-bioconda)
    * [Configuration profiles](#33-configuration-profiles)
4. [Reference genomes](#4-reference-genomes)

## 1) Install NextFlow
Nextflow runs on most POSIX systems (Linux, Mac OSX etc). It can be installed by running the following commands:

```bash
# Make sure that Java v8+ is installed:
java -version

# Install Nextflow
curl -fsSL get.nextflow.io | bash

# Add Nextflow binary to your PATH:
mv nextflow ~/bin/
# OR system-wide installation:
# sudo mv nextflow /usr/local/bin
```

See [nextflow.io](https://www.nextflow.io/) for further instructions on how to install and configure Nextflow.

## 2) Install the pipeline

#### 2.1) Automatic
This pipeline itself needs no installation - NextFlow will automatically fetch it from GitHub if `h3abionet/h3arefgraph` is specified as the pipeline name.

#### 2.2) Offline
The above method requires an internet connection so that Nextflow can download the pipeline files. If you're running on a system that has no internet connection, you'll need to download and transfer the pipeline files manually:

```bash
wget https://github.com/h3abionet/h3arefgraph/archive/master.zip
mkdir -p ~/my-pipelines/h3abionet/
unzip master.zip -d ~/my-pipelines/h3abionet/
cd ~/my_data/
nextflow run ~/my-pipelines/h3abionet/h3arefgraph-master
```

To stop nextflow from looking for updates online, you can tell it to run in offline mode by specifying the following environment variable in your ~/.bashrc file:

```bash
export NXF_OFFLINE='TRUE'
```

#### 2.3) Development

If you would like to make changes to the pipeline, it's best to make a fork on GitHub and then clone the files. Once cloned you can run the pipeline directly as above.


## 3) Pipeline configuration
By default, the pipeline loads a basic server configuration [`conf/base.config`](../conf/base.config)
This uses a number of sensible defaults for process requirements and is suitable for running
on a simple (if powerful!) local server.

Be warned of two important points about this default configuration:

1. The default profile uses the `local` executor
    * All jobs are run in the login session. If you're using a simple server, this may be fine. If you're using a compute cluster, this is bad as all jobs will run on the head node.
    * See the [nextflow docs](https://www.nextflow.io/docs/latest/executor.html) for information about running with other hardware backends. Most job scheduler systems are natively supported.
2. Nextflow will expect all software to be installed and available on the `PATH`
    * It's expected to use an additional config profile for docker, singularity or conda support. See below.

#### 3.1) Software deps: Docker
First, install docker on your system: [Docker Installation Instructions](https://docs.docker.com/engine/installation/)

Then, running the pipeline with the option `-profile docker` tells Nextflow to enable Docker for this run. An image containing all of the software requirements will be automatically fetched and used from dockerhub (https://hub.docker.com/r/nfcore/h3arefgraph).

#### 3.1) Software deps: Singularity
If you're not able to use Docker then [Singularity](http://singularity.lbl.gov/) is a great alternative.
The process is very similar: running the pipeline with the option `-profile singularity` tells Nextflow to enable singularity for this run. An image containing all of the software requirements will be automatically fetched and used from singularity hub.

If running offline with Singularity, you'll need to download and transfer the Singularity image first:

```bash
singularity pull --name nf-core-h3arefgraph.simg shub://h3abionet/h3arefgraph
```

Once transferred, use `-with-singularity` and specify the path to the image file:

```bash
nextflow run /path/to/nf-core-h3arefgraph -with-singularity nf-core-h3arefgraph.simg
```

Remember to pull updated versions of the singularity image if you update the pipeline.


#### 3.2) Software deps: conda
If you're not able to use Docker _or_ Singularity, you can instead use conda to manage the software requirements.
This is slower and less reproducible than the above, but is still better than having to install all requirements yourself!
The pipeline ships with a conda environment file and nextflow has built-in support for this.
To use it first ensure that you have conda installed (we recommend [miniconda](https://conda.io/miniconda.html)), then follow the same pattern as above and use the flag `-profile conda`

#### 3.3) Configuration profiles

See [`docs/configuration/adding_your_own.md`](configuration/adding_your_own.md)

## 4) Reference genomes

See [`docs/configuration/reference_genomes.md`](configuration/reference_genomes.md)
