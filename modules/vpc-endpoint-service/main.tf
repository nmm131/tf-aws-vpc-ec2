// There should be a VPC endpoint service created to expose this service to client s- all application ports need to be exposed over the endpoint
resource "aws_vpc_endpoint_service" "example" {
  acceptance_required        = false
  network_load_balancer_arns = var.network_load_balancer_arns
}
