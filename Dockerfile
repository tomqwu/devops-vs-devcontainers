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

# Install pip3
RUN curl -s -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py

# Install awscli
RUN pip3 install awscli && \
    aws --version

# Install aws-iam-authenticator

ENV AWS_IAM_AUTHENTICATOR_VERSION=1.12.7 HELM_VERSION=v2.14.1

RUN curl -s -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/$AWS_IAM_AUTHENTICATOR_VERSION/2019-03-27/bin/linux/amd64/aws-iam-authenticator && \
    chmod +x ./aws-iam-authenticator && \
    mv ./aws-iam-authenticator /usr/local/bin/ && \
    aws-iam-authenticator version

# Install HELM
RUN wget -q https://get.helm.sh/helm-$HELM_VERSION-linux-amd64.tar.gz && \
    tar xzf helm-$HELM_VERSION-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    rm -rf linux-amd64 helm-$HELM_VERSION-linux-amd64.tar.gz && \
    helm version -c

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND=dialog

# Set the default shell to bash instead of sh
ENV SHELL /bin/bash