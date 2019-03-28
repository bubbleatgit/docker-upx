FROM golang:alpine
  
LABEL "images maintainer"="bubble <tingshow163@gamil.com>" \
      "upx author"="upyun <https://github.com/upyun/upx>" \
      version="0.2.3"

ENV UPXVERSION 0.2.3

RUN set -eux; \
        wget -O upx-${UPXVERSION}.tar.gz https://github.com/upyun/upx/archive/v${UPXVERSION}.tar.gz; \
        tar zxvf upx-${UPXVERSION}.tar.gz -C $GOPATH/src/; \
        rm -rf upx-${UPXVERSION}.tar.gz; \
        cd $GOPATH/src/upx-${UPXVERSION}; \
        go get -d -v && go install -v; \
        mv $GOPATH/bin/upx-${UPXVERSION} $GOPATH/bin/upx; \
        rm -rf /go/src/upx-${UPXVERSION}; \
        mkdir -p /upx_resources

WORKDIR /upx_resources
