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
3. groups ubuntu
# Verify docker
1. docker --version
#  Create project repository on GitHub and clone it
1. git clone https://github.com/user-name/<repo-name>
2. Take the source code from free resources like google.
3. cd repo to create files.
# Create Dockerfile
1. nano Dockerfile
# Build docker image locally
1. docker build -t <image-name> .
# Run application container
1. docker run -d -p host-port:container-port <image-name>
# Verify container
1. docker ps 
2. docker inspect <container-id>
3. docker logs <container-name>
# Run application locally
1. curl http://localhost:3000
# Access application on browser
1. http://public-ec2-ip:application port
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
1. http://ec2-ip:port
# END



