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
* Integrate notifications and automation with Slack, Giphy, and AWS

## 📦 Technologies Used

* GitHub Actions
* Docker
* Kubernetes (kind)
* Go
* Giphy API
* Slack API

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


### 📢 Notifications

* Sends Slack notifications on workflow status updates (success, failure)
* Uses Giphy API to post fun reaction GIFs to Slack channels for build outcomes
* Uses AWS CLI to deploy artifacts or update cloud resources (optional, extendable)

---

## ✅ How to Use

1. Clone the repository:

```bash
   git clone https://github.com/your-username/github-actions-demo.git
   cd github-actions-demo
```

2. Setup environment secrets for integrations:
   ```bash
   * SLACK_WEBHOOK_URL — Slack Incoming Webhook URL for sending notifications
   * GIPHY_API_KEY — Giphy API key to fetch GIFs
   * AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY — AWS credentials for deployment tasks
   ```
   Go to your repository settings, then **Secrets and variables** > **Actions** > **New repository secret** to add these secrets.

3. Push changes to trigger the workflow

4. Monitor the run in the **Actions** tab on GitHub

---

## 📚 Useful Resources

* [GitHub Actions Documentation](https://docs.github.com/en/actions)
* [Awesome Actions (Community-curated list)](https://github.com/sdras/awesome-actions)
* [Creating a Workflow](https://docs.github.com/en/actions/using-workflows)
* [Go Programming Language](https://go.dev/)
* [kind - Kubernetes IN Docker](https://kind.sigs.k8s.io/)
* [Docker Documentation](https://docs.docker.com/)
* [Slack API Documentation](https://api.slack.com/)
* [Giphy API Documentation](https://developers.giphy.com/docs/)
* [AWS CLI Documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)

---

## 🚰 Future Improvements

* Add linter and formatter checks
* Add integration testing
* Add Helm chart support for deployment

---

## 🧑‍💻 Author

Created by [Rohith Raju](https://github.com/DexRoku)

## 📄 License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
