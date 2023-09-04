FROM node:alpine
COPY . /app
WORKDIR /app
CMD echo "This is the first image to publish"