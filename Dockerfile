FROM golang:1.19.1

WORKDIR /bem-te-vi

RUN git clone https://github.com/droposhado/bem-te-vi /bem-te-vi && \
    go mod download && \
    go build -o /usr/local/bin/app

ENTRYPOINT ["/usr/local/bin/app"]
