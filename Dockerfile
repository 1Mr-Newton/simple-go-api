# Use the official Golang image
FROM golang:alpine

# Install curl
RUN apk update && apk add curl

# Set the current working directory inside the container
WORKDIR /app

# Copy the go.mod file
COPY go.mod ./

# Download dependencies (there will be none initially)
RUN go mod download

# Copy the source code
COPY . .

# Build the Go app
RUN go build -o /go-api-server

# Expose the port the app runs on
EXPOSE 8080

# Command to run the executable
CMD ["/go-api-server"]
