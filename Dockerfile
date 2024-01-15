# Use the official .NET Core SDK as a base image for build
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env

# Set the working directory inside the container
WORKDIR /app

# Copy the project files to the container
COPY . ./

# Build the application
RUN dotnet publish -c Release -o out

# Use the official .NET Core runtime as a base image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1

# Set the working directory inside the container
WORKDIR /app

# Copy the published application from the build container
COPY --from=build-env /app/out .

# Set the entry point for the application
ENTRYPOINT ["dotnet", "MyDotNetApp.dll"]

