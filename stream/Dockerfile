FROM node:20-alpine

# Set the working directory
WORKDIR /app

# Instalar curl para healthcheck
RUN apk add --no-cache curl

# Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm install --production

# Copy the rest of the application files
COPY . ./

# Expose the port used by the stream service
EXPOSE 4000

# Start the server
CMD ["node", "src/server.js"]
CMD ["node", "src/server.js"]