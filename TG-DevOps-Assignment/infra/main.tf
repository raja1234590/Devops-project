provider "aws" {
  region = var.region
}

# S3 Buckets
resource "aws_s3_bucket" "raw_data" {
  bucket = var.raw_bucket_name
}

resource "aws_s3_bucket" "processed_data" {
  bucket = var.processed_bucket_name
}

# IAM Role for EKS pod access
resource "aws_iam_role" "eks_s3_access_role" {
  name = var.iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "eks.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "s3_access_policy" {
  name = "s3-access-policy"
  role = aws_iam_role.eks_s3_access_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = [
          aws_s3_bucket.raw_data.arn,
          "${aws_s3_bucket.raw_data.arn}/*",
          aws_s3_bucket.processed_data.arn,
          "${aws_s3_bucket.processed_data.arn}/*"
        ]
      }
    ]
  })
}

# EKS Cluster
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.29"
  vpc_id          = var.vpc_id
  subnets         = var.subnets
}

