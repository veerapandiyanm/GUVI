# Use an appropriate base image, for example, nginx for serving static content
FROM nginx:alpine

# Copy the built application to the appropriate directory in the container
COPY build/ /usr/share/nginx/html

# Expose port 80
EXPOSE 80
