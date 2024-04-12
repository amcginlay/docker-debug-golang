# docker build . --tag prod-image --file Dockerfile
# docker run --name prod-server --publish 8080:80 prod-image

# commented lines below correspond to addiitonal layers required only for debugging (see Dockerfile.debug)
FROM golang:1.22-alpine3.19 AS build
WORKDIR /src
COPY ./src/main.go .
# RUN CGO_ENABLED=0 go install -ldflags "-s -w -extldflags '-static'" github.com/go-delve/delve/cmd/dlv@v1.22.1
RUN GO111MODULE=off CGO_ENABLED=0 go build -gcflags "all=-N -l" -o main .

FROM alpine:3.19 AS run
WORKDIR /app
COPY --from=build /src/main .
# COPY --from=build /go/bin/dlv .
EXPOSE 80
# EXPOSE 4000
CMD [ "./main" ]
# CMD [ "./dlv", "exec", "./main", "--listen=:4000", "--continue", "--headless=true", "--log=true", "--accept-multiclient", "--api-version=2" ]
