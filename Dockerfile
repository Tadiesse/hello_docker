FROM node:alpine
LABEL org.opencontainers.image.source="https://github.com/Tadiesse/hello_docker"
COPY . /app
WORKDIR /app
CMD echo "This is the first image to publish"