resource "aws_iam_user" "dev_user" {
  name = "bedrock-dev-view-v3"
}

resource "aws_iam_access_key" "dev_key" {
  user = aws_iam_user.dev_user.name
}

resource "aws_iam_user_policy_attachment" "dev_readonly" {
  user       = aws_iam_user.dev_user.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_user_policy" "dev_s3_put" {
  name = "bedrock-dev-s3-write"
  user = aws_iam_user.dev_user.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["s3:PutObject", "s3:PutObjectAcl"]
      Resource = "${aws_s3_bucket.assets.arn}/*"
    }]
  })
}