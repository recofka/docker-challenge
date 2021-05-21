FROM golang:alpine AS builder

WORKDIR /go/src

COPY . .

RUN go build main.go

FROM scratch
COPY --from=builder /go/src/main main

ENTRYPOINT [ "./main" ]