# tf aws vpc ec2

## future considerations
- Use a backend to store the terraform.tfstate file

- Move `vpc-endpoint-service` module into the `vpc` module

- Implement logging for the load balancer

- Use variables for resources

- Rename resources and align on standard naming convention. Resources were copied directly from Terraform documentation.

- Use terraform.tfvars for sensitive variables' values