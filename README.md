# 🧩 PocketBase on Kubernetes with CI/CD

This project demonstrates how to containerize and deploy [PocketBase](https://pocketbase.io/) to a local Kubernetes cluster using **Minikube**, with infrastructure automation via **Ansible** and continuous integration using **GitHub Actions**.

---

## 🚀 Tech Stack

| Tool            | Purpose                                       |
|-----------------|-----------------------------------------------|
| **PocketBase**  | Lightweight backend and admin UI              |
| **Docker**      | Containerization                              |
| **GitHub Actions** | CI pipeline to build and push Docker image |
| **Kubernetes**  | Application orchestration                     |
| **Minikube**    | Local Kubernetes cluster                      |
| **Ansible**     | Deployment automation                         |
| **kubectl**     | Kubernetes CLI                                |

---

## 🧱 Project Structure

pocketbase_project/
├── deploy/
│ └── deploy.yml # Ansible playbook to deploy to Kubernetes
├── docker/
│ └── Dockerfile # Dockerfile to containerize PocketBase
├── k8s/
│ └── pocketbase-deployment.yaml # Kubernetes Deployment and Service
├── .github/
│ └── workflows/
│ └── docker-ci.yml # GitHub Actions workflow for CI
└── README.md


---

## ⚙️ How It Works

1. **Docker Image Build**
   - Dockerfile builds an Alpine-based image with PocketBase CLI + Admin UI embedded.
   - The container exposes port `8090`.

2. **CI with GitHub Actions**
   - On every push to `main`, GitHub Actions:
     - Builds the Docker image.
     - Pushes it to Docker Hub: `harriscybersecdevop/pocketbase:latest`.

3. **Kubernetes Deployment**
   - Minikube is used to create a local Kubernetes cluster.
   - A Deployment spins up 1 replica of the container.
   - A NodePort Service exposes it externally.

4. **Ansible for CD**
   - The `deploy/deploy.yml` playbook applies the Kubernetes manifests automatically.

5. **Accessing the Admin UI**
   - Use `minikube service pocketbase-service` to expose the UI and API.
   - Admin UI runs on the root path (`/`).
   - API endpoints start with `/api`.

---

## 🛠️ Setup Instructions

### 1. Clone the Repo

```bash
git clone https://github.com/yourusername/pocketbase_project.git
cd pocketbase_project
docker build -t harriscybersecdevop/pocketbase:latest .
docker push harriscybersecdevop/pocketbase:latest
minikube start
ansible-playbook deploy/deploy.yml
minikube service pocketbase-service
This will open the PocketBase Admin UI in your browser.

curl http://127.0.0.1:<PORT>/api/collections
You’ll receive a 401 Unauthorized response unless you provide an admin token.


---

Let me know if you'd like this `README.md` turned into a live file or if you'd like badges, screenshots, or setup videos linked as well.
Created by @harriscybersecdevop
