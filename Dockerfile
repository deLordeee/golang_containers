FROM golang:1.21 as builder

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -o main .

FROM gcr.io/distroless/static-debian12
COPY --from=builder /app/main /
CMD ["/main"]