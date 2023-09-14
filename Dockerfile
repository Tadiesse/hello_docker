FROM node:alpine
LABEL org.opencontainers.image.source="https://github.com/Tadiesse/hello_docker"
COPY . /app
WORKDIR /app
CMD echo "This container image has to be signed with asymetric cyphers"
