FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install

# Inyectar variables de entorno para la compilación de Vite (import.meta.env)
ARG VITE_API_BASE=/api
ARG VITE_STREAM_BASE=/stream
ARG VITE_HUB_URL=/hub/rooms
ENV VITE_API_BASE=$VITE_API_BASE \
	VITE_STREAM_BASE=$VITE_STREAM_BASE \
	VITE_HUB_URL=$VITE_HUB_URL

COPY . .
RUN npm run build

FROM nginx:1.27-alpine AS runtime
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
