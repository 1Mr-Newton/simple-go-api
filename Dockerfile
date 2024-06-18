# Stage 1: Build the application
FROM golang:alpine AS builder

# Install curl and wget
RUN apk add --no-cache curl wget

# Set the current working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files
COPY go.mod ./

# Download dependencies
RUN go mod download

# Copy the source code
COPY . .

# Build the Go app
RUN go build -o go-api-server

# Stage 2: Run the application
FROM alpine:latest

# Set the current working directory inside the container
WORKDIR /root/

# Copy the built executable from the builder stage
COPY --from=builder /app/go-api-server .
  
# Health check
HEALTHCHECK --interval=5s --timeout=10s --start-period=10s CMD curl -f http://localhost:8080/ || exit 1

# Command to run the executable
CMD ["./go-api-server"]
