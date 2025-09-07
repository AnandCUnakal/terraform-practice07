provider "aws" {
  region = "us-east-1"  # You can change the region as needed
}

# Create an IAM user
resource "aws_iam_user" "new_user" {
  name = "new-terraform-user-acu"
}

# Attach a policy to the IAM user
resource "aws_iam_user_policy_attachment" "user_policy_attachment" {
  user       = aws_iam_user.new_user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"  # Change this policy as needed
}

# Create Access Keys for the IAM user
resource "aws_iam_access_key" "user_access_key" {
  user = aws_iam_user.new_user.name
}

# Output the user's Access Key and Secret Access Key
output "access_key_id" {
  value = aws_iam_access_key.user_access_key.id
}

output "secret_access_key" {
  value = aws_iam_access_key.user_access_key.secret
  sensitive = true
}
