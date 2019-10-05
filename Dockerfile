FROM golang as builder
WORKDIR /opt/go/src/github.com/osamu329/docker-echo
ENV CGO_ENABLE=0 GOOS=linux GOARCH=amd64
COPY go.mod go.sum ./
RUN GO111MODULE=on go mod download
COPY . ./
RUN go build -o /docker-echo

FROM debian:latest
RUN apt-get update && apt-get upgrade -y
COPY --from=builder /docker-echo /docker-echo
CMD ["/docker-echo"]


