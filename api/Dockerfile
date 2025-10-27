FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copiamos proyecto primero para optimizar restore cache
COPY PartyJukebox.Api.csproj ./
RUN dotnet restore PartyJukebox.Api.csproj

# Copiamos el resto del código
COPY . .
RUN dotnet publish PartyJukebox.Api.csproj -c Release -o /app/publish /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

# Instalar curl para permitir healthcheck basado en curl dentro del contenedor
RUN apt-get update \
	&& apt-get install -y --no-install-recommends curl \
	&& rm -rf /var/lib/apt/lists/*

COPY --from=build /app/publish .
EXPOSE 8080
ENV ASPNETCORE_URLS=http://+:8080
ENTRYPOINT ["dotnet", "PartyJukebox.Api.dll"]
