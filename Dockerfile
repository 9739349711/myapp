# Use official Node base image
FROM node:18

# Create app folder inside container
WORKDIR /app

# Copy package files first
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all project files
COPY . .

# Expose port
EXPOSE 3000

# Command to start app
CMD ["node", "app.js"]
