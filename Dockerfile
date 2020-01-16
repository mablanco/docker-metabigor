FROM golang:1.13.5-alpine3.10 as builder
ARG METABIGOR_VERSION=v1.0
RUN apk add git
RUN CGO_ENABLED=0 GOOS=linux go get -v -ldflags "-linkmode external -extldflags -static" -u github.com/j3ssie/metabigor

FROM alpine:3.10
WORKDIR /
COPY --from=builder /go/bin/metabigor .
ENTRYPOINT ["/metabigor"]
