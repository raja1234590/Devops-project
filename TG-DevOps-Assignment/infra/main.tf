provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "raw_data" {
  bucket = "raw-data"
}

resource "aws_s3_bucket" "processed_data" {
  bucket = "processed-data"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  cluster_name = "data-processing-cluster"
  cluster_version = "1.29"
  subnets = ["subnet-xxxxx", "subnet-yyyyy"]
  vpc_id  = "vpc-xxxxxx"
}
