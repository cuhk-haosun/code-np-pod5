# How to run docker of pod5 conversion
# Fastq files quality control overview

This repository contains a Dockerfile to build a Docker image designed to convert Fast5 files to Pod5 format using the pod5 tool. It includes an `entrypoint.sh` script that serves as the entry point for the Docker image, and GitHub Actions workflow configurations for automated building, pushing, and signing of the Docker image.


# Usage

# Run manually with cmd line
```bash
docker run -it --rm \
  -v ./fast5:/mnt/in \
  -v ./output:/mnt/out \
  ghcr.io/cuhk-haosun/code-docker-pod5:latest

# Run via github action
 Simply fill in the forms listed in the github action
