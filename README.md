# GitHub Actions Project

This repository contains a simple Go application and a Kubernetes deployment setup, used to learn and experiment with **GitHub Actions** — GitHub's built-in CI/CD automation tool.

---

## 🚀 Purpose

The goal of this project is to:

* Understand how GitHub Actions work
* Build and test a Go application
* Build and push a Docker image
* Deploy the application to local Kubernetes clusters using `kind`
* Learn CI/CD concepts like workflows, jobs, caching, and multi-environment deployment

---

## 📁 Repository Structure

```
.
├── README.md
├── go-app/                 # Go application source code
│   ├── Dockerfile          # Dockerfile to containerize the app
│   ├── go.mod              # Go module file
│   ├── go.sum              # Go dependencies lock file
│   ├── main.go             # Go application entry point
│   └── main_test.go        # Unit tests for the Go app
├── k8s/                    # Kubernetes deployment files
│   ├── prod/               # Production deployment manifests
│   │   ├── deployment.yml
│   │   └── service.yml
│   └── test/               # Development/test deployment manifests
│       ├── deployment.yml
│       └── service.yml
└── .github/
    └── workflows/
        └── main.yml        # GitHub Actions workflow file
```
---

## ⚙️ What This Workflow Does

The GitHub Actions workflow (`main.yml`) includes the following jobs:

### 🔨 Build & Test

* Triggers on push to `main` or manual `workflow_dispatch`
* Checks out the code
* Sets up Go environment
* Caches dependencies
* Runs unit tests

### 🐳 Docker Image

* Builds and pushes the Docker image to Docker Hub

### ☸️ Deploy to Kubernetes

* Creates local `kind` clusters (`dev-cluster`, `prod-cluster`)
* Pulls and loads the Docker image into the cluster
* Applies Kubernetes manifests for `test` and `prod` environments

---

## ✅ How to Use

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/github-actions-demo.git
   cd github-actions-demo
   ```

2. Push changes to trigger the workflow

3. Monitor the run in the **Actions** tab on GitHub

---

## 📚 Useful Resources

* [GitHub Actions Documentation](https://docs.github.com/en/actions)
* [Awesome Actions (Community-curated list)](https://github.com/sdras/awesome-actions)
* [Creating a Workflow](https://docs.github.com/en/actions/using-workflows)
* [Go Programming Language](https://go.dev/)
* [kind - Kubernetes IN Docker](https://kind.sigs.k8s.io/)

---

## 🚰 Future Improvements

* Add linter and formatter checks
* Add integration testing
* Add Helm chart support for deployment
* Add GitHub Pages for documentation

---

## 🧑‍💻 Author

Created by [Rohith Raju](https://github.com/DexRoku)
