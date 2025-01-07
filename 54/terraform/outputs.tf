
# Outputs
output "instance_public_ip" {
  value = aws_instance.ec2_instance.public_ip
  description = "The public IP of the EC2 instance"
}

output "instance_private_ip" {
  value = aws_instance.ec2_instance.private_ip
  description = "The private IP of the EC2 instance"
}

# Output the VPC and Subnet IDs
output "vpc_id" {
  value       = aws_vpc.example_vpc.id
  description = "The ID of the created VPC"
}

output "subnet_id" {
  value       = aws_subnet.example_public_subnet.id
  description = "The ID of the created public subnet"
}
