FROM golang AS builder

WORKDIR /app

COPY go.mod go.sum /app/
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 go build -o build/fizzbuzz

FROM scratch

COPY --from=builder /app/build/fizzbuzz /

COPY --from=builder /app/templates /templates

CMD ["/fizzbuzz", "serve", "--port=8080"]