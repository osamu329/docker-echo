FROM golang as builder
WORKDIR /opt/go/src/
COPY go.mod go.sum .
RUN go mod download
COPY . /
RUN go build . -o /docker-echo

FROM debian:latest
RUN apt-get update && apt-get upgrade
COPY --from builder /docker-echo /docker-echo
CMD ["/docker-echo"]


