# nodejs-demo-app
Automate Code Deployment Using CI/CD Pipeline (GitHub Actions)
# pre-requisites
1. node.js app - Source Code and package.json file
2. Dockerfile - Build Docker Image
3. .github/workflows/yml file - CI/CD Pipeline
4. .dockerignore file - avoids unneccesary file upload
5. GitHub repository - to push source code and configuration files.
6. EC2-server - run application
# SSH into EC2 using Git Bash/mobaxterm/vs-code
1. ssh -i pem-key user-name@ec2-ip
# Install Docker
1. sudo apt update && sudo apt install docker.io -y
2. sudo usermod -aG docker ubuntu - adds the user ubuntu to the docker group
3. newgrp docker
4. docker ps - verify if user add
# Install docker plugins if build is deprecated
1. docker-ce
2. docker-ce-cli
3. containerd.io
4. docker-buildx-plugin
5. docker-compose-plugin
# Set up Docker's repository
1. sudo apt update && sudo apt install ca-certificates curl
2. sudo install -m 0755 -d /etc/apt/keyrings
3. sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
   -o /etc/apt/keyrings/docker.asc
4. sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository:
1. sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
   Types: deb
   URIs: https://download.docker.com/linux/ubuntu
   Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
   Components: stable
   Architectures: $(dpkg --print-architecture)
   Signed-By: /etc/apt/keyrings/docker.asc
   EOF
2. sudo apt update
3. sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# Verify docker
1. docker --version
2. docker buildx version
3. sudo systemctl status docker
#  Create project repository on GitHub and clone it
1. git clone https://github.com/user-name/<repo-name>
2. Take the source code from free resources like google.
3. cd repo to create files.
# Files needed to be created
1. app.js
2. package.json
# Run node.js locally
1. npm install
2. npm test
3. npm build
3. npm start
4. curl http://localhost:3000
5. http://ec2-ip:3000
# Create Dockerfile
1. nano Dockerfile
# Build docker image locally
1. docker build -t <image-name> .
2. docker buildx build -t web-app --load . (buildx)
# Run application container
1. docker run -d -p host-port:container-port <image-name>
# Verify container
1. docker ps 
2. docker inspect <container-id>
3. docker logs <container-name>
# Run application locally
1. curl http://localhost:host-port
# Access application on browser
1. http://public-ec2-ip:host-port
# Docker Hub
1. Create an account in docker hub.
2. Login docker hub using credentials
# Tag & Push docker Image
1. docker tag username/repo-name:latest
2. docker push username/repo-name:latest
# GitHub Secrets
1. Repository --> Settings --> Secrets & variables --> Actions --> New repository secret
2. Add docker username and token to authenticate docker hub and push the image.
3. Add EC2 host IP, username and SSH key to authenticate EC2-server
# Required GitHUb Scerets
1. DOCKER_USERNAME
2. DOCKER_TOKEN
3. HOST_IP
4. SSH_KEY
# GitHub Actions
1. Create yaml file .github/workflows
2. Add .gitignore file to ignore unnecessary git files and directories
2. Configure jobs and steps to build, test, push docker image and deploy an application
3. Add environment variables in GitHub Secrets.
4. Push the changes to the remote repository.
5. Click on GitHub Actions to check the workflow runs.
# Verify the deployment
1. Check GitHub logs if it success
1. docker image ls
2. docker ps
# Test application on browser
1. http://ec2-ip:host-port
# GitHub Actions Workflow
1. push to main
2. GitHub Actions
3. npm ci
4. npm test
5. docker build
6. tag image with :latest and :github-sha
7. push both images to Docker Hub
8. SSH into EC2
9. docker pull :github-sha
10. stop old container
11. remove old container
12. start new container
# END
