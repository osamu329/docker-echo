FROM golang as builder
WORKDIR /opt/go/src/
COPY go.mod go.sum .
RUN go mod download

