### Create a Website with DevOps Tools: Step-by-Step Guide

#### **Step 1: Choose a Cloud Provider**
- **Action**: Select a cloud provider such as Google Cloud Platform (GCP).
- **Explanation**: GCP offers reliable infrastructure for deploying and managing your applications.

---

#### **Step 2: Create a Virtual Machine**
- **Action**: Set up a virtual machine (VM) on GCP.
- **Explanation**: The VM acts as the server where your website and tools will be hosted.

---

#### **Step 3: Install Docker**
- **Commands**:
  ```bash
  sudo -i
  apt-get update
  apt install docker.io
  docker -v
  ```
- **Explanation**:
  - Switch to the root user using `sudo -i`.
  - Update the package list using `apt-get update`.
  - Install Docker using `apt install docker.io`.
  - Verify the Docker installation with `docker -v`.

*Example Output*:  
```plaintext
Docker version 24.0.7, build 24.0.7-0ubuntu2~20.04.1
```

---

#### **Step 4: Download Website Files**
- **Actions**:
  - Download a free website template from [Free CSS](https://www.free-css.com/).
  - Install `wget` and `unzip` utilities if not already installed.
- **Commands**:
  ```bash
  apt install wget unzip
  wget <URL-to-website-template>
  unzip <template-file>.zip -d /root/
  ```
- **Explanation**:  
  `wget` is used to download files from the internet, and `unzip` extracts the downloaded files.

---

#### **Step 5: Run Nginx Container with the Website**
- **Command**:
  ```bash
  docker run -ti -d -p 80:80 -v /root/inance-html:/usr/share/nginx/html nginx
  ```
- **Explanation**:
  - This command runs an Nginx container.
  - The `-v` flag mounts the downloaded website files (`/root/inance-html`) to the Nginx web server's default directory (`/usr/share/nginx/html`).
  - The `-p` flag maps port 80 of the VM to port 80 of the container.

---

#### **Step 6: Access the Website**
- **Action**: Open your web browser and navigate to `http://<VM-IP>:80`.
- **Explanation**: Replace `<VM-IP>` with the IP address of your virtual machine to view the hosted website.

---

### Additional Docker Commands for Managing Containers

#### **Run a React App in Docker**
- **Command**:
  ```bash
  docker run -d --restart unless-stopped --name win11react -p 3000:3000 blueedge/win11react:latest
  ```
- **Explanation**:
  - Pulls and runs the `blueedge/win11react` container.
  - Maps the container's port 3000 to the VM's port 3000.
  - The `--restart unless-stopped` ensures the container restarts automatically unless stopped manually.

#### **Check Running Containers**
- **Command**:
  ```bash
  docker ps
  ```
- **Explanation**: Lists all active Docker containers.

#### **Stop and Remove a Container**
- **Commands**:
  ```bash
  docker stop <container-id>
  docker rm <container-id>
  ```
- **Explanation**:
  - Replace `<container-id>` with the actual ID of the container (e.g., `abcd1234`).
  - Stops and removes the specified container.
