resource "aws_iam_role" "ec2_full_access_ssm_role" {
  name               = "ec2-full-access-ssm-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": {"Service": "ec2.amazonaws.com"},
    "Action": "sts:AssumeRole"
  }
}
EOF
}

resource "aws_iam_role_policy_attachment" "ec2_ssm_attachment" {
  role       = aws_iam_role.ec2_full_access_ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}


# resource "aws_ssm_activation" "test_ssm_activation" {
#   name               = "test_ssm_activation"
#   description        = "test_ssm_activation"
#   iam_role           = aws_iam_role.ec2_full_access_ssm_role.id
#   registration_limit = "5"
#   depends_on         = [aws_iam_role_policy_attachment.ec2_ssm_attachment]
# }

resource "aws_iam_instance_profile" "cmcloudlab_profile" {
  name = "cmcloudlab_profile"
  role = aws_iam_role.ec2_full_access_ssm_role.name
}