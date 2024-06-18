# Use the official Golang image
FROM golang:alpine 
RUN sudo apt-get update && sudo apt-get install -y --no-install-recommends curl wget

WORKDIR /app
COPY . .
RUN go build -o /server .

FROM scratch
COPY --from=build /server /server
EXPOSE 8080
CMD ["/server"]