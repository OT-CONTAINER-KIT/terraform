FROM alpine:3.9.6
LABEL maintainer="Devesh Sharma <devesh.sharma@opstree.com>"
ENV TERRAFORM_VERSION 0.12.7
RUN apk --update --no-cache add libc6-compat git openssh-client curl python py-pip python3 

RUN cd /usr/local/bin && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip
USER terraform
WORKDIR /WORKDIR
ENTRYPOINT [ "/usr/local/bin/terraform"]
