# Inception

```bash

##need to check tls cirtificate
docker exec -it nginx openssl s_client -connect localhost:443 -tls1_3

docker network ls
docker compose ps
docker compose up -d
docker volume ls
docker volume inspect db_data
# 🐳 Docker — Summary

## 📌 What is Docker?

- **VM = Hardware + OS + Dependencies + App**
- **Container = Shared Host OS Kernel + Dependencies + App**

➡️ Virtual Machines include their own kernel → Heavy  
➡️ Containers share the host kernel → Lightweight & Faster

---

## 🧠 Kernel & OS Structure

- **Operating System = Kernel Mode + User Mode**
- Docker **does not install a new kernel for every app**
- Containers reuse the **host machine kernel**

---

## 🍱 Image vs Container

| Concept       | Meaning                                                      |
|---------------|--------------------------------------------------------------|
| **Image**     | A read-only blueprint containing layers + dependencies + app |
| **Container** | A running instance of an image                               |

➡️ One image can run many containers.

---

## 🛡️ Docker Internals

- **Namespaces** → Isolation between containers (processes, network…)
- **Cgroups (Control Groups)** → Limits CPU, memory, etc.

> Namespaces isolate resources.  
> Cgroups control resource usage.

---

## 🚀 Common Docker Commands

### 🔹 Image Commands
| Command                     | Description                    |
|-----------------------------|--------------------------------|
| `docker pull <image>:<tag>` | Download image from Docker Hub |
| `docker images`             | List all images                |
| `docker image rm <image>`   | Remove an image                |
| `docker image prune -a`     | Remove all unused images       |

### 🔹 Container Commands
| Command                               | Description                                 |
|---------------------------------------|---------------------------------------------|
| `docker run <image>`                  | Create and start a container                |
| `docker run --name <name> <image>`    | Start a container with a specific name      |
| `docker run --rm <image>`             | Remove container automatically on exit      |
| `docker ps`                           | Show running containers                     |
| `docker ps -a`                        | Show all containers                         |
| `docker stop <container>`             | Stop a running container                    |
| `docker container rm <id>`            | Remove a stopped container                  |
| `docker container prune`              | Remove all stopped containers               |
| `docker logs <container>`             | Display container logs                      |

---

## 🧱 Dockerfile — Basic Instructions

| Instruction         | Purpose                                                     |
|---------------------|-------------------------------------------------------------|
| `COPY <src> <dest>` | Copy files into container filesystem                        |
| `RUN <cmd>`         | Execute a command during the image build                    |
| `CMD <cmd>`         | Default command when container starts *(can be overridden)* |
| `USER <username>`   | Change default container user                               |
| `WORKDIR <path>`    | Set working directory inside container                      |

Example:
docker run --rm alpine:latest /bin/sh

# Domain
DOMAIN_NAME=abouramt.42.fr

# Database Configuration
DB_HOST=mariadb
MYSQL_DATABASE=wordpress
MYSQL_USER=wp_user
MYSQL_PASSWORD=root
MYSQL_ROOT_PASSWORD=root

# WordPress Configuration
WP_URL=https://abouramt.42.fr
WP_TITLE=inception
WP_ADMIN_USER=abouramt
WP_ADMIN_PASSWORD=abouramt123
WP_ADMIN_EMAIL=abouramt@student.1337.ma

# Optional: Secondary User
WP_USER=test
WP_EMAIL=test@student.1337.ma
WP_USER_PASSWORD=test123
