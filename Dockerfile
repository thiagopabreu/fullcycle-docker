FROM golang:1.20-alpine AS builder

RUN apk add --no-cache git

WORKDIR /app

COPY main.go .

RUN go build -ldflags="-s -w" -o myapp main.go

FROM scratch

COPY --from=builder /app/myapp /myapp

CMD ["/myapp"]