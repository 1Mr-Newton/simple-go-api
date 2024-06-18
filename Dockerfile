# Use the official Golang image
FROM golang:alpine 
WORKDIR /app
COPY . .
RUN go build -o /server .

FROM scratch
COPY --from=build /server /server
EXPOSE 8080
CMD ["/server"]