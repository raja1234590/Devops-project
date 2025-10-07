# AWS region
variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

# EKS cluster name
variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "data-processing-cluster"
}

# S3 buckets
variable "raw_bucket_name" {
  description = "Raw data S3 bucket name"
  type        = string
  default     = "raw-data"
}

variable "processed_bucket_name" {
  description = "Processed data S3 bucket name"
  type        = string
  default     = "processed-data"
}

# Networking
variable "vpc_id" {
  description = "VPC ID for EKS cluster"
  type        = string
}

variable "subnets" {
  description = "List of subnets for EKS"
  type        = list(string)
}

# IAM role for S3 access
variable "iam_role_name" {
  description = "IAM role name for EKS pod access to S3"
  type        = string
  default     = "eks-s3-access-role"
}
