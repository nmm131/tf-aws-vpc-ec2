output "vpc_endpoint_service_id" {
  value = module.vpc-endpoint-service.aws_vpc_endpoint_service.example.id
}

output "vpc_endpoint_service_arn" {
  value = module.vpc-endpoint-service.aws_vpc_endpoint_service.example.arn
}
