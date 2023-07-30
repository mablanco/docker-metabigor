FROM golang:1.20.6-alpine3.18 as builder
ENV GOOS=linux
ARG METABIGOR_VERSION=v1.2.5
RUN apk add git gcc libc-dev
RUN go install -ldflags "-linkmode external -extldflags -static" github.com/j3ssie/metabigor@$METABIGOR_VERSION

FROM scratch
WORKDIR /
COPY --from=builder /go/bin/metabigor .
ENTRYPOINT ["/metabigor"]
