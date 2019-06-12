FROM ubuntu:bionic

# Configure apt
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils 2>&1

RUN apt-get -y install git procps lsb-release unzip wget curl ca-certificates build-essential file

# Install Terraform
RUN wget https://releases.hashicorp.com/terraform/0.12.1/terraform_0.12.1_linux_amd64.zip && \
    unzip terraform_0.12.1_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_0.12.1_linux_amd64.zip && terraform version

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog

# Set the default shell to bash instead of sh
ENV SHELL /bin/bash
