FROM golang:1.15.5-alpine3.12 as builder
ENV GOOS=linux
RUN apk add git gcc libc-dev
RUN go get -v -ldflags "-linkmode external -extldflags -static" -u github.com/j3ssie/metabigor

FROM alpine:3.12.1
WORKDIR /
COPY --from=builder /go/bin/metabigor .
ENTRYPOINT ["/metabigor"]
