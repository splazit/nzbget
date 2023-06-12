FROM alpine
RUN apk update && \
    apk add --no-cache libssh2 ca-certificates && \
    wget https://nzbget.net/download/nzbget-latest-bin-linux.run && \
    sh nzbget-latest-bin-linux.run

ENTRYPOINT ["/nzbget/nzbget"]
CMD ["-s","-c","/config/nzbget.conf"]
