resource "aws_ssm_parameter" "database_master_password" {
  name  = "database_master_password"
  type  = "SecureString"
  value = random_password.database_master_password.result
}