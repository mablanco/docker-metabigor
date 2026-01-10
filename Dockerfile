FROM golang:1.25.5-alpine3.23 AS builder
ARG METABIGOR_VERSION=v2.0.1
RUN apk add git gcc libc-dev
RUN git clone --depth 1 --branch $METABIGOR_VERSION https://github.com/j3ssie/metabigor.git
RUN cd metabigor && go install

FROM alpine:3.23.2
COPY --from=builder /go/bin/metabigor /bin/metabigor
ENTRYPOINT ["/bin/metabigor"]
