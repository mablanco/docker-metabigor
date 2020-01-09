FROM golang:1.13.5-alpine3.10 as builder
RUN apk add git
RUN CGO_ENABLED=0 GOOS=linux go get -v -u github.com/j3ssie/metabigor

FROM scratch
WORKDIR /
COPY --from=builder /go/bin/metabigor .
ENTRYPOINT ["/metabigor"]
