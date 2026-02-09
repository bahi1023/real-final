variable "aws_region" {
  description = "The AWS Region to deploy the cluster into"
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name prefix for resources"
  default     = "eks-platform"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS Cluster"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EKS worker nodes"
  type        = string
}

variable "principal_arn" {
  description = "IAM Principal ARN to grant cluster access"
  type        = string
}

variable "environment" {
  description = "Deployment environment (prod or dev)"
  type        = string
  default = "prod"
}

# Added for API Gateway / Two-Pass deployment
variable "nlb_dns_name" {
  description = "The DNS name of the Network Load Balancer created by Ingress Controller"
  type        = string
  default     = "http://ad35500d01e134011b5c099b8cf2d790-285955ccaa426fc9.elb.us-east-1.amazonaws.com"
}

# Added for IRSA
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "irsa_roles" {
  description = "Map of IRSA roles to create"
  type = map(object({
    namespace            = string
    service_account_name = string
    policy_arns          = list(string)
  }))
  default = {}
}
