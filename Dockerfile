FROM golang:alpine3.16 AS builder

WORKDIR /app

COPY ./main.go .
COPY ./go.mod .

RUN go build

FROM scratch 

WORKDIR /app

COPY --from=builder /app/codeeducation . 

CMD [ "./codeeducation" ]