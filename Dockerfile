FROM alpine:3.9.6 as builder
ENV TERRAFORM_VERSION 0.12.25
RUN apk --update --no-cache add libc6-compat curl
WORKDIR /workdir
RUN cd /workdir && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

FROM gcr.io/distroless/base
LABEL maintainer="Devesh Sharma <devesh.sharma@opstree.com>"
COPY --from=builder /workdir/terraform /usr/local/bin/
WORKDIR /workdir
ENTRYPOINT [ "/usr/local/bin/terraform"]
