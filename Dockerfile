FROM alpine:3.9.6 as builder
ENV TERRAFORM_VERSION 1.1.2
RUN apk --update --no-cache add libc6-compat curl git
WORKDIR /workdir
RUN cd /workdir && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

FROM gcr.io/distroless/base
LABEL maintainer="Neha Sinha <neha.sinha@opstree.com>"
COPY --from=builder /workdir/terraform /usr/local/bin/
COPY --from=builder /usr/bin/git /usr/bin/git 
USER nonroot
WORKDIR /workdir
ENTRYPOINT [ "/usr/local/bin/terraform"]
