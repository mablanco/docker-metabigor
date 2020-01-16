FROM golang:1.13.6-alpine3.11 as builder
RUN apk add git
RUN GOOS=linux go get -v -ldflags "-linkmode external -extldflags -static" -u github.com/j3ssie/metabigor

FROM alpine:3.11.2
WORKDIR /
COPY --from=builder /go/bin/metabigor .
ENTRYPOINT ["/metabigor"]
