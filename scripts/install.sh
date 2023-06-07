#!/bin/bash
adduser man-sinh-lee
usermod -aG wheel man-sinh-lee
mkdir /home/man-sinh-lee/.ssh -p
echo '%wheel   ALL=(ALL:ALL) NOPASSWD: ALL' >>/etc/sudoers
echo 'export PS1="\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32;47m\]\\$\[\e[m\]"' >>/root/.bashrc
echo 'export PS1="\[\e[32m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]:\[\e[36m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32;47m\]\\$\[\e[m\]"' >>/home/man-sinh-lee/.bashrc
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCrsFm6uvfjTQBGBeNeiTVtSyYhnzjZ9yQYUmFBKH4XuTPOYnlXr99krlmaDZL6xf/r6VtjK+8tJRky/pvjAHUGSavwsknqq7mC8prjVhorhnCs3ra9UXn6vScATeCSMxFTaV/zMPgxgsP0/7ajPMd9L6WYEu4taVUEhF738C4/1XAZO9uoORoo8R9IKnub9gh43+n0T+w4vg+ikG6uhNWTAOPk4lFkSPqz7+G9VUI3oOCNbVkFY1q8mnXjYZlkvUPCQ4G0XbYyk+ZNFBKFZjGCk4N9NzLAxoXtAm1rbB7uN5w7WMgSa5yFrWe5IiUSg1O5gDMN+cMkIqV60zVM68h6rkvLZfR9hcxE7XIeYmvLzG5Dl4eXm0nJuAY5scD8sHLe3vj3xUJXrdfs6LX51dp4C7VtnwYct++i2aLZ+EqF69BOpO75q6zZ02+iP0+ZwBcHPXvjjyy+HUhY/X5HU7djSa/gJCnDV3pUnenPztmkmvIoDUo3tV9TNOKazsZhobs9YFvHRmVkm2LPoPfe36a8WB3sj7cVpbkb5rGxBfuFfF3lEKNuCqVvZ2ObfaJzUjAXs35IHWtk2VDGFsmvM5qRA8jOU8GG3W/MOhxTh4E5yu6djKivtYuIgktSf+VtUNemFgvIRdDYlSWExgHZ39jy+BXNay5c2hURt4UC1o9djQ== man-sinh-lee@SreDevOps' >>/home/man-sinh-lee/.ssh/authorized_keys
chown -R man-sinh-lee:wheel /home/man-sinh-lee
yum -y install httpd
hostname -i >/var/www/html/index.html
systemctl enable httpd --now
