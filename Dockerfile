FROM alpine

RUN apk update && \
    apk add --no-cache libssh2 ca-certificates && \
    wget https://nzbget.net/download/nzbget-latest-bin-linux.run && \
    update-ca-certificates && \
    sh nzbget-latest-bin-linux.run
HEALTHCHECK --start-period=3s --timeout=1s --interval=10s CMD ["/bin/nc","-z","127.0.0.1","6789"]
ENTRYPOINT ["/nzbget/nzbget"]
CMD ["-s","-c","/config/nzbget.conf","-o","OutputMode=log"]
