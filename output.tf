
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = aws_eks_cluster.main.name
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = aws_eks_cluster.main.endpoint
}

output "api_gateway_url" {
  description = "URL of the API Gateway"
  value       = aws_apigatewayv2_api.main.api_endpoint
}

output "cognito_user_pool_id" {
  description = "Cognito User Pool ID"
  value       = aws_cognito_user_pool.main.id
}

output "cognito_client_id" {
  description = "Cognito App Client ID"
  value       = aws_cognito_user_pool_client.client.id
}

output "cognito_client_secret" {
  description = "Cognito App Client Secret"
  value       = aws_cognito_user_pool_client.client.client_secret
  sensitive   = true
}

output "cognito_issuer_url" {
  description = "Cognito Issuer URL"
  value       = "https://cognito-idp.${var.aws_region}.amazonaws.com/${aws_cognito_user_pool.main.id}"
}

output "nlb_dns_name" {
  description = "The DNS name of the Network Load Balancer"
  value       = var.nlb_dns_name
}

output "cognito_login_url" {
  description = "Direct link to the Cognito Hosted UI Login page"
  value       = "https://${aws_cognito_user_pool_domain.main.domain}.auth.${var.aws_region}.amazoncognito.com/login?client_id=${aws_cognito_user_pool_client.client.id}&response_type=code&scope=email+openid+profile&redirect_uri=${aws_apigatewayv2_api.main.api_endpoint}/oauth2/callback"
}