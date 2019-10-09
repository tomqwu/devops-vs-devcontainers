FROM tomqwu/devops-vs-devcontainers-base:1.0

# Install java
RUN apt update && apt install -y openjdk-8-jre-headless

# Install sbt
ARG SBT_VERSION=1.2.8

RUN \
  curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install -y sbt && \
  sbt sbtVersion

# Install Terraform
ARG TF_VER=0.12.10
RUN wget -q https://releases.hashicorp.com/terraform/${TF_VER}/terraform_${TF_VER}_linux_amd64.zip && \
    unzip terraform_${TF_VER}_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_${TF_VER}_linux_amd64.zip && terraform version

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

# Install azcli
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash && \
    az -v

# Install gcloud sdk
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | \
    tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && \
    apt-get update && apt-get install -y google-cloud-sdk && \
    gcloud -v

# Install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    kubectl version --client=true

