FROM --platform=linux golang:1.22.6-alpine3.19 as build

WORKDIR /app

COPY . .

RUN go build -o app .

FROM alpine:latest

WORKDIR /app

COPY --from=build /app/app .

EXPOSE 1323

CMD ["./app"]