FROM golang

WORKDIR /app

COPY . .

COPY go.mod /app/

COPY go.sum /app/

RUN go mod download

COPY . .

RUN go build -o build/fizzbuzz

CMD [ "./build/fizzbuzz", "serve" ]