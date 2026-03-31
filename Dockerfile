FROM golang:1.20-alpine AS builder
WORKDIR $GOPATH/src/github.com/netology-code/sdvps-materials
COPY . ./
RUN CGO_ENABLED=0 GOOS=linux go build -a installsuffix nocgo -o /app .

FROM alpine:latest
RUN apk -U add ca-certificates
COPY --from=builder /app /app
ENTRYPOINT ["/app"]
CMD ["World"]