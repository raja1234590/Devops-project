# Devops-project



This repository automates the process of reading, transforming, and writing CSV data between S3 buckets using an AWS EKS CronJob.

---


- `infra/`: Terraform scripts for AWS resources
- `app/`: Python processing logic + Dockerfile
- `k8s/`: Kubernetes manifests (CronJob, RBAC)
- `.github/`: GitHub Actions CI/CD workflow

---

##  Setup
1. Configure AWS credentials in GitHub Secrets:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
2. Push code to `main` → pipeline runs automatically.

---

##  CronJob
Runs once daily at midnight (UTC) to:
1. Read from `raw-data` bucket.
2. Convert `name` column to uppercase.
3. Upload processed file to `processed-data`.

---


