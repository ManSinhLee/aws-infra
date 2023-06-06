# resource "aws_instance" "cmcloudlab_public_web_1a" {
#   ami                    = data.aws_ami.amz_linux_2.id
#   instance_type          = var.instance_type
#   key_name               = aws_key_pair.key_pair.key_name
#   subnet_id              = aws_subnet.public_subnet[0].id
#   vpc_security_group_ids = [aws_security_group.public_sg.id]
#   user_data              = file("scripts/install.sh")
#   tags = {
#     "Name"     = "cmcloudlab_public_web_1a",
#     "UserName" = "CloudMan"
#   }
# }


# resource "aws_instance" "cmcloudlab_private_app_1a" {
#   ami                    = data.aws_ami.amz_linux_2.id
#   instance_type          = var.instance_type
#   key_name               = aws_key_pair.key_pair.key_name
#   subnet_id              = aws_subnet.private_subnet[0].id
#   vpc_security_group_ids = [aws_security_group.private_sg.id]
#   user_data              = file("~/bash-codes/install.sh")
#   tags = {
#     "Name"     = "cmcloudlab_private_app_1a",
#     "UserName" = "CloudMan"
#   }
# }