FROM golang:1.21.6-alpine3.19 AS builder
ARG METABIGOR_VERSION=v2.0.0
RUN apk add git gcc libc-dev
RUN git clone --depth 1 --branch $METABIGOR_VERSION https://github.com/j3ssie/metabigor.git
RUN cd metabigor && go install

FROM alpine:3.20.3
COPY --from=builder /go/bin/metabigor /bin/metabigor
ENTRYPOINT ["/bin/metabigor"]
