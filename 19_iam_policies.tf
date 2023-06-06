resource "aws_iam_policy" "ssm_full_access_policy" {
  name        = "ssm_full_access_policy"
  description = "ssm_full_access_policy"
  policy      = file("ssm_full_access_policy.json")
}