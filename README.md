# Octopus Deployment

This repository contains the deployment automation for the Octopus take-home application.

---

## 🚀 Overview

The deployment uses:

- **Ansible** for automation
- **Amazon EC2** as the application host
- **NGINX** as a reverse proxy
- **Node.js** as the backend application
- **MongoDB Atlas** as the database

---

## 🧱 Architecture
Internet
↓
NGINX (EC2)
↓
Node.js App
↓
MongoDB Atlas


---

## ⚙️ What this repository does

This repository automates the full deployment process:

- Installing required system packages
- Cloning the application repository
- Installing Node.js dependencies
- Generating the application environment file (`.env`)
- Configuring a systemd service for the application
- Configuring NGINX as a reverse proxy

---

## 📁 Repository Structure
``` bash
deployment/
├── ansible.cfg
├── site.yml
├── inventory/
│ └── hosts.ini.example
├── group_vars/
│ └── all.example.yml
├── roles/
│ ├── common/
│ ├── node_app/
│ └── nginx/
└── README.md
```

---

## 📋 Requirements

Before running the deployment:

- Ansible installed locally
- SSH private key for the EC2 instance
- A running EC2 instance with:
  - Port **22** open to your IP
  - Port **80** open publicly
- MongoDB Atlas configured to allow access from the EC2 instance

---

## 🔧 Configuration

This repository includes **example configuration files only**.

Create local working copies:

```bash
cp inventory/hosts.ini.example inventory/hosts.ini
cp group_vars/all.example.yml group_vars/all.yml
```

## Example inventory
[web]
app-server ansible_host=YOUR_EC2_PUBLIC_IP ansible_user=ubuntu

## Example variables
app_name: octopus-app
app_user: ubuntu
app_dir: /opt/octopus-app
app_subdir: app

app_repo_url: "https://github.com/YOUR_USERNAME/YOUR_APP_REPO.git"
app_repo_version: "main"

app_port: 3000

mongo_uri: "REPLACE_ME"
db_name: "octopusdb"
collection_name: "fruits"

Run Deployment:
- ansible -i inventory/hosts.ini web -m ping --private-key ./CA.pem
- ansible-playbook -i inventory/hosts.ini site.yml --private-key ./CA.pem
- curl http://my_public_ip
