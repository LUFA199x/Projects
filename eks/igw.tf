resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.mainVpc.id

  tags = {
    Name = "igw"
  }
}