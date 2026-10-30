FROM golang:1.26.10-alpine3.24 AS builder
ARG METABIGOR_VERSION=v2.2.0
RUN apk add git
RUN git clone --depth 1 --branch $METABIGOR_VERSION https://github.com/j3ssie/metabigor.git
RUN cd metabigor && CGO_ENABLED=0 go build -trimpath -ldflags "-s -w" -o /go/bin/metabigor ./cmd/metabigor

FROM alpine:3.24.3
COPY --from=builder /go/bin/metabigor /bin/metabigor
ENTRYPOINT ["/bin/metabigor"]
