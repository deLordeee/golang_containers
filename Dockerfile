FROM golang:1.20 as builder

WORKDIR /app
COPY . .
RUN go build -o main .

CMD ["./main"]