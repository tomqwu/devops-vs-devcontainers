FROM tomqwu/devops-vs-devcontainers-base:1.3

RUN curl -L https://mirror.openshift.com/pub/openshift-v4/clients/helm/latest/helm-linux-amd64 -o /usr/local/bin/helm && \
    chmod +x /usr/local/bin/helm && \
    helm version

RUN wget -qO- https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz | tar xzf - && \
    cd openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit && mv oc kubectl /usr/local/bin
