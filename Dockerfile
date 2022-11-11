FROM golang:1.16-buster AS build

WORKDIR /app

COPY go.mod ./

COPY *.go ./

RUN go build -o /desafio-go

FROM scratch

WORKDIR /

COPY --from=build /desafio-go /desafio-go

ENTRYPOINT ["/desafio-go"]