resource "aws_launch_template" "cmcloudlab-lt" {
  name                                 = "cmcloudlab-lt"
  image_id                             = data.aws_ami.amz_linux_2.id
  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = "t2.micro"
  iam_instance_profile {
    name = aws_iam_instance_profile.cmcloudlab_profile.name
  }
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 10
      volume_type = "gp3"
    }
  }

  monitoring {
    enabled = true
  }
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  user_data              = filebase64("scripts/install.sh")
  tags = {
    "Name" = "cmcloudlab-lt"
  }
}