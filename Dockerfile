FROM golang:1.15.5-alpine3.12 as builder
RUN apk add git gcc libc-dev
RUN GOOS=linux go get -v -ldflags "-linkmode external -extldflags -static" -u github.com/j3ssie/metabigor

FROM alpine:3.12.1
WORKDIR /
COPY --from=builder /go/bin/metabigor .
ENTRYPOINT ["/metabigor"]
