resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = element(aws_subnet.public_subnets.*.id, 0)

  tags = {
    Name = "${var.environment}-natgw"
  }
  depends_on = [aws_internet_gateway.eks-igw]
}