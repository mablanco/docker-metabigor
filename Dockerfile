FROM golang:1.17.6-alpine3.15 as builder
ENV GOOS=linux
RUN apk add git gcc libc-dev
RUN go get -v -ldflags "-linkmode external -extldflags -static" -u github.com/j3ssie/metabigor

FROM scratch
WORKDIR /
COPY --from=builder /go/bin/metabigor .
ENTRYPOINT ["/metabigor"]
