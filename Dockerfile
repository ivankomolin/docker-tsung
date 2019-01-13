FROM erlang:21.2.2-alpine as build

ENV VERSION 1.7.0

RUN apk add --no-cache make bash && \
    wget -q http://tsung.erlang-projects.org/dist/tsung-${VERSION}.tar.gz && \
    tar zxf tsung-${VERSION}.tar.gz && \
    cd tsung-${VERSION} && \
    ./configure && \
    make && \
    make install

CMD ["/usr/local/bin/tsung", "-h"]