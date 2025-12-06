terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
#####################
# 1. PROVIDERS
#####################

# Default provider → Region 1 (Mumbai)
provider "aws" {
  region = "ap-south-1"
}

# Secondary provider → Region 2 (N. Virginia)
provider "aws" {
  alias  = "us_east"
  region = "us-east-1"
}
#####################
# 2. EC2 in MUMBAI
#####################

resource "aws_instance" "linux_mumbai" {
  ami           = "ami-0ba259e664698cbfc" # Amazon Linux 2 in ap-south-1 (example)
  instance_type = "t3.micro"

  tags = {
    Name = "TF-Mumbai-Instance"
  }
}

#####################
# 3. EC2 in N. VIRGINIA
#####################

resource "aws_instance" "linux_virginia" {
  provider      = aws.us_east
  ami           = "ami-0e86e20dae9224db8" # Amazon Linux 2 in us-east-1 (example)
  instance_type = "t3.micro"

  tags = {
    Name = "TF-Virginia-Instance"
  }
}
