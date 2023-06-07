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
  #user_data              = filebase64("scripts/install.sh")
  user_data = <<-EOT
    #!/bin/bash
    adduser man-sinh-lee
    usermod -aG wheel man-sinh-lee
    mkdir /home/man-sinh-lee/.ssh -p
    echo '%wheel   ALL=(ALL:ALL) NOPASSWD: ALL' >>/etc/sudoers
    echo 'export PS1="\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32;47m\]\\$\[\e[m\]"' >>/root/.bashrc
    echo 'export PS1="\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32;47m\]\\$\[\e[m\]"' >>/home/man-sinh-lee/.bashrc
    echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDB22htn8/aBbHIu6Uo8tSLIvGCqWGCp9ps1sc9quWrWjAN2Vx6JxDLBSQrYACAtJ6sk5npTOObGGd5RzSlinO+oi8QEqb3zojsXBhRWYzHVu5dmxiTPRn+QKfisvHIj0YIARiouXsO9Eor/8QnBFrl2zZTy63kfFnog6NEHwukD9OY4/oy8y1/hKL+BW7/xAzncD/Le4MmAmr4mWku783PKEvOi+COd25oMSrz2q0+3veoAl7D7IWj+JaPxOmlmy3f6DxmQ4LF7+XXKrgmwM/LXaqEnjAKt6pWKa5cE7a/fAlAtuN6w95LJmGKOPzLuaIa7v6YIOTCd6q8a1ezzz1+mQ6Ol/FhBk+kGGZd3wKS+6yI2ZRU7hDkxaBAjeilb+N1xr883RwaZBCBUsR6zcpg0kROvvYsY4JrjRKmbttyjFphPCUoHUBF5SvH6jM3swP3ztU9+oxiGiDziWad4iamwR1dnHl5pPFSmUoJ4C1kzStpghnEWt8fanTDGbnfFFzqbS/rwHGHxk2dZnxit/GgZLcP1mwFfV1PgwJfDuuhqTQXopukkh7poupYidr00rHyUiwm4D0nLYyd0uPihoDrFe3eDptE6NZHBiKT13NzP2bnFB5vC+T5gJ6keUDkOkzzqzJ99CXgEANg8shA47nTSXppYldYI2ihY0r3zmiI3w== man-sinh-lee@DevSecOps' >>/home/man-sinh-lee/.ssh/authorized_keys
    chown -R man-sinh-lee:wheel /home/man-sinh-lee
    yum -y install httpd
    hostname -i >/var/www/html/index.html
    systemctl enable httpd --now
  EOT
  tags = {
    "Name" = "cmcloudlab-lt"
  }
}