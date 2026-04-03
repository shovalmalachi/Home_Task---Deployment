# Octopus Deployment

This repository contains the deployment automation for the Octopus take-home application.

## Overview

The deployment uses:

- Ansible for automation
- EC2 as the application host
- NGINX as a reverse proxy
- Node.js application backend
- MongoDB Atlas as the database

## Architecture

```text
Internet
  ->
NGINX on EC2
  ->
Node.js app
  ->
MongoDB Atlas

What this repository does

This repository automates:

installation of required packages
cloning the application repository
installing Node.js dependencies
generating the application environment file
configuring a systemd service for the app
configuring NGINX as a reverse proxy
Repository structure
deployment/
├── ansible.cfg
├── site.yml
├── inventory/
│   └── hosts.ini.example
├── group_vars/
│   └── all.example.yml
├── roles/
│   ├── common/
│   ├── node_app/
│   └── nginx/
└── README.md
Requirements
Ansible installed locally
An SSH private key for the EC2 instance
A running EC2 instance with:
port 22 open to your IP
port 80 open publicly
MongoDB Atlas access configured for the EC2 instance IP
