resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.eks_vpc.id

tags = {
    Name = "${var.environment}-public_route"
  }
}
resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.eks_vpc.id

tags = {
    Name = "${var.environment}-private_route"
  }
}
 resource "aws_route" "public_igw" {
  route_table_id            = "rtb-058dbe597aabbed0a"
  gateway_id = aws_internet_gateway.eks-igw.id
  destination_cidr_block    = "0.0.0.0/0"
  depends_on                = [aws_internet_gateway.eks-igw]
 }
 
resource "aws_route" "private_igw" {
  route_table_id            = "rtb-08258f0d99bd6b6b2"
  gateway_id = aws_nat_gateway.nat_gw.id
  destination_cidr_block    = "0.0.0.0/0"
  depends_on                = [aws_nat_gateway.nat_gw]
 }
 resource "aws_route_table_association" "public_association" {
 count = length(var.public_subnets)
 subnet_id = element(aws_subnet.public_subnets.*.id ,count.index)
  route_table_id = aws_route_table.public_route.id
}
resource "aws_route_table_association" "private_association" {
 count = length(var.private_subnets)
 subnet_id = element(aws_subnet.private_subnets.*.id ,count.index)
  route_table_id = aws_route_table.private_route.id
}