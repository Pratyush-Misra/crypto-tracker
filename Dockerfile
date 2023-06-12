# Use a Node 16 base image
FROM node:16-alpine 
WORKDIR /app
COPY . .
EXPOSE 3000
CMD [ "npm", "start" ]