terraform {
  backend "s3" {
    bucket = "state.cmcloudlab605.info"
    key    = "terraform.state"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.19"
    }
  }
}


# > regex("\\d+\\.\\d+", "10.0.0.0/16")
# "10.0"
# > regex("\\d+\\.\\d+", "172.31.0.0/16")
# "172.31"
# > regex("\\d+\\.\\d+", "192.168.0.0/16")
# "192.168"