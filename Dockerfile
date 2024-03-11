FROM golang:latest AS builder
WORKDIR /go/src
RUN apt-get update && \
    touch fullcycle.go && \
    go mod init fullcycle
COPY fullcycle.go /go/src/fullcycle.go
RUN go build -o ./fullcycle fullcycle.go 

FROM scratch
WORKDIR /bin
COPY --from=builder /go/src/fullcycle /bin/fullcycle
CMD [ "fullcycle" ]
