# resource "aws_db_instance" "cmcloudlab_mysql" {
#   allocated_storage      = 20
#   max_allocated_storage  = 100
#   engine                 = "mysql"
#   engine_version         = "8.0.28"
#   instance_class         = "db.t3.small"
#   db_name                = "cmcloudlab_db"
#   username               = "admin"
#   password               = random_password.database_master_password.result
#   parameter_group_name   = "default.mysql8.0"
#   skip_final_snapshot    = true
#   deletion_protection    = false
#   multi_az               = true
#   db_subnet_group_name   = aws_db_subnet_group.cmcloudlab_db_subnet_group.name
#   vpc_security_group_ids = [aws_security_group.database_sg.id]
# }

resource "aws_rds_cluster" "cmcloudlab_mysql_serverless" {
  cluster_identifier      = "cmcloudlab-mysql-serverless"
  engine                  = "aurora-mysql"
  engine_mode             = "serverless"
  database_name           = "cmcloudlab"
  enable_http_endpoint    = true
  master_username         = "admin"
  master_password         = random_password.database_master_password.result
  backup_retention_period = 1
  skip_final_snapshot     = true
  scaling_configuration {
    auto_pause               = true
    min_capacity             = 1
    max_capacity             = 2
    seconds_until_auto_pause = 300
    timeout_action           = "ForceApplyCapacityChange"
  }
  db_subnet_group_name   = aws_db_subnet_group.cmcloudlab_db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.database_sg.id]
}