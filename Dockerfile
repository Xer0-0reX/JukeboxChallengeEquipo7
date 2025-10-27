# Stage 1: Build Stage
FROM node:18 AS builder

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm install --production

# Copy the application source code
COPY . .

# Stage 2: Runtime Stage
FROM node:18-slim

# Set working directory
WORKDIR /app

# Copy only the necessary files from the build stage
COPY --from=builder /app /app

# Expose the port used by the application
EXPOSE 4000

# Start the application
CMD ["node", "src/server.js"]