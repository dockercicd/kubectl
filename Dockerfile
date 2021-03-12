FROM alpine
ARG VERSION="v1.20.4"

RUN apk update && apk add curl gettext bash
RUN curl -LO "https://dl.k8s.io/release/$VERSION/bin/linux/amd64/kubectl" \
#    && echo "a5895007f331f08d2e082eb12458764949559f30bcc5beae26c38f3e2724262c  kubectl" | sha256sum -c \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/kubectl \
    && rm -rf /var/cache/apk/* \
    && kubectl

ENTRYPOINT ["kubectl"]
