resource "aws_iam_role" "demo-4" {

  name = "eks-cluster-demo-4"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY


}

resource "aws_iam_role_policy_attachment" "demo-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.demo-4.name
}

resource "aws_eks_cluster" "demo-4" {
  name     = "demo-4"

  role_arn = aws_iam_role.demo-4.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private-eu-west-2a.id,    
      aws_subnet.private-eu-west-2b.id,
      aws_subnet.private-eu-west-2c.id,
      aws_subnet.public-eu-west-2a.id,
      aws_subnet.public-eu-west-2b.id,
      aws_subnet.public-eu-west-2c.id
    ]
    
  }

  depends_on = [aws_iam_role_policy_attachment.demo-AmazonEKSClusterPolicy]

}