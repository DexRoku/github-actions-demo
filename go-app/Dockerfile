# Start from the official Go image as the build stage
FROM golang:1.23 as builder

# Set the working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum first for caching
COPY go.mod ./
COPY go.sum ./

# Download dependencies
RUN go mod download

# Copy the rest of your application
COPY . .

# Build the Go app
RUN go build -o app

# Start a minimal image for the runtime
FROM alpine:latest

# Set working directory
WORKDIR /root/

# Copy binary from builder
COPY --from=builder /app/app .

CMD ["./app"]
