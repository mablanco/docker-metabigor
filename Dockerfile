FROM golang:1.26.11-alpine3.24 AS builder
ARG METABIGOR_VERSION=v2.2.0
RUN apk add git
RUN git clone --depth 1 --branch $METABIGOR_VERSION https://github.com/j3ssie/metabigor.git
# Bump golang.org/x/net past GO-2026-6860 until upstream updates it
RUN cd metabigor && go get golang.org/x/net@v0.62.0 && go mod tidy
RUN cd metabigor && CGO_ENABLED=0 go build -trimpath -ldflags "-s -w" -o /go/bin/metabigor ./cmd/metabigor

FROM alpine:3.24.4
# Pick up security fixes published after the base image (e.g. zlib CVE-2026-4738)
RUN apk upgrade --no-cache
COPY --from=builder /go/bin/metabigor /bin/metabigor
ENTRYPOINT ["/bin/metabigor"]
