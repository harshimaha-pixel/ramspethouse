# Use the official .NET SDK image to build and publish the application
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

# Copy the project files
COPY ramspethouse/*.csproj ./
RUN dotnet restore

# Copy the rest of the application files
COPY ramspethouse/. ./
RUN dotnet publish -c Release -o out

# Use the runtime image to run the application
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app/out .

# Expose the port the application runs on
EXPOSE 80

# Run the application
ENTRYPOINT ["dotnet", "pethouse.dll"]