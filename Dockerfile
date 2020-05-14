FROM alpine:3

ARG BUILD_DATE
ARG VCS_REF

LABEL maintainer="James Hunt <images@huntprod.com>" \
      summary="Synchronize Maildir and IMAP mailboxes" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/filefrog/mbsync.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0.0"

RUN apk update \
 && apk add isync curl \
 && rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/mbsync"]
