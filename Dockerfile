FROM golang:1.17.2-alpine3.14 as builder
ENV GOOS=linux
RUN apk add git gcc libc-dev
RUN go get -v -ldflags "-linkmode external -extldflags -static" -u github.com/j3ssie/metabigor

FROM alpine:3.14.2
WORKDIR /
COPY --from=builder /go/bin/metabigor .
ENTRYPOINT ["/metabigor"]
