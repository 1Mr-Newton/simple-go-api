# # Start with the official Go image
# FROM golang:1.20-alpine

# # Set the working directory inside the container
# WORKDIR /app

# # Copy the Go module files
# COPY go.mod ./
# RUN go mod download

# # Copy the source code
# COPY . .

# # Build the Go app
# RUN go build -o /simple-go-api

# # Expose the port the app runs on
# EXPOSE 8080

# # Run the app
# CMD ["/simple-go-api"]
# Dockerfile

FROM golang:alpine

# Install necessary packages
RUN apt-get update && apt-get install -y curl wget

# Set the working directory
WORKDIR /app

# Copy the Go application
COPY . .

# Build the application
RUN go build -o out


EXPOSE 8080

# Command to run the application
CMD ["./out"]