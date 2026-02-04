# Use the official .NET SDK image as a build stage
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app

# Copy the project files
COPY ./ramspethouse/*.csproj ./
COPY ./ramspethouse/ ./

# Restore dependencies
RUN dotnet restore

# Build the application
RUN dotnet publish -c Release -o out

# Use the runtime image for the final stage
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app

# Copy the build output
COPY --from=build /app/out .

# Expose the application on port 80
EXPOSE 80

# Run the application
ENTRYPOINT ["dotnet", "ramspethouse.dll"]