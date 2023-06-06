resource "aws_db_subnet_group" "cmcloudlab_db_subnet_group" {
  name       = "cmcloudlab_db_subnet_group"
  subnet_ids = aws_subnet.database_subnet.*.id
  tags = {
    "Name" = "cmcloudlab_db_subnet_group"
  }
}