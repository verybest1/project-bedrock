# Developer IAM User
resource "aws_iam_user" "dev_user" {
  name = "bedrock-dev-view-v2"
}

resource "aws_iam_user_policy_attachment" "dev_readonly" {
  user       = aws_iam_user.dev_user.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

# Explicit S3 PutObject Permission for Assets Bucket
resource "aws_iam_user_policy" "dev_s3_put" {
  name = "bedrock-dev-s3-write"
  user = aws_iam_user.dev_user.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["s3:PutObject", "s3:GetObject"]
      Resource = "${aws_s3_bucket.assets.arn}/*"
    }]
  })
}

# Access Keys for Grading Submission
resource "aws_iam_access_key" "dev_key" {
  user = aws_iam_user.dev_user.name
}

# EKS Access Entry scoped to retail-app namespace
resource "aws_eks_access_entry" "dev_entry" {
  cluster_name  = aws_eks_cluster.main.name
  principal_arn = aws_iam_user.dev_user.arn
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "dev_policy" {
  cluster_name  = aws_eks_cluster.main.name
  principal_arn = aws_iam_user.dev_user.arn
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"

  access_scope {
    type       = "namespace"
    namespaces = ["retail-app"]
  }
}