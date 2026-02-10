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
  default     = "http://example.com"
}

variable "nlb_listener_arn" {
  description = "The ARN of the Network Load Balancer Listener for VPC Link"
  type        = string
  default     = "arn:aws:elasticloadbalancing:us-east-1:344809605543:listener/net/ac81b965afa184b83b4822d34f763502/cb38a1cd417f9401/65651cea8b29a8ad"
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
