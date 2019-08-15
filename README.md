# h3abionet/h3arefgraph
**RefGraph Workflows Hackathon**

[![Build Status](https://travis-ci.org/h3abionet/h3arefgraph.svg?branch=master)](https://travis-ci.org/h3abionet/h3arefgraph)
[![Nextflow](https://img.shields.io/badge/nextflow-%E2%89%A50.32.0-brightgreen.svg)](https://www.nextflow.io/)

[![install with bioconda](https://img.shields.io/badge/install%20with-bioconda-brightgreen.svg)](http://bioconda.github.io/)
[![Docker](https://img.shields.io/docker/automated/nfcore/h3arefgraph.svg)](https://hub.docker.com/r/nfcore/h3arefgraph)
![Singularity Container available](
https://img.shields.io/badge/singularity-available-7E4C74.svg)

### Introduction
This pipeline is for the use and testing of graph based methods for variant calling. 

The aim is to allow the user to choose the reference graph construction method and the alignment / variant calling methods separately. 

We also provide tools for reporting the results of the variant calling, that take advantage of the additional contextual information that using reference graphs provides. 

The pipeline is built using [Nextflow](https://www.nextflow.io), a workflow tool to run tasks across multiple compute infrastructures in a very portable manner. It comes with docker / singularity containers making installation trivial and results highly reproducible.


### Documentation
The h3abionet/h3arefgraph pipeline comes with documentation about the pipeline, found in the `docs/` directory:

1. [Installation](docs/installation.md)
2. Pipeline configuration
    * [Local installation](docs/configuration/local.md)
    * [Adding your own system](docs/configuration/adding_your_own.md)
    * [Reference genomes](docs/configuration/reference_genomes.md)  
3. [Running the pipeline](docs/usage.md)
4. [Output and how to interpret the results](docs/output.md)
5. [Troubleshooting](docs/troubleshooting.md)

<!-- TODO nf-core: Add a brief overview of what the pipeline does and how it works -->

### Credits
h3abionet/h3arefgraph was originally written by the H3ABioNet RefGraph Team.
