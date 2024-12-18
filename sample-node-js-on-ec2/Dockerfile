# Use an official Node.js runtime as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json for dependency installation
COPY package*.json ./

# Install application dependencies
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Expose the application's port (e.g., 3000)
EXPOSE 3000

# Define the command to run the application
CMD ["npm", "start"]
