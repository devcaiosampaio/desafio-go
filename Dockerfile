FROM golang:1.22.0-alpine3.18 AS builder

WORKDIR /app

COPY ola-mundo.go .

RUN go build -o server ola-mundo.go

FROM scratch

WORKDIR /app

COPY --from=builder app/server .

EXPOSE 8080

CMD ["/app/server"]