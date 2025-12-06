#---------------- PROVIDERS -------------------#

provider "aws" {
  region = "ap-south-1"
  alias  = "mumbai"
}

provider "aws" {
  region = "us-east-1"
  alias  = "virginia"
}

#--------------- EC2 for REGION 1 ----------------#

resource "aws_instance" "mumbai_server" {
  provider = aws.mumbai
  ami           = "ami-0f58b397bc5c1f2e8" # Amazon Linux in ap-south-1
  instance_type = "t3.micro"

  user_data = <<-EOF
    #!/bin/bash
    sudo yum install -y nginx
    sudo systemctl enable nginx
    sudo systemctl start nginx
  EOF

  tags = {
    Name = "Mumbai-Web-Server"
  }
}

#--------------- EC2 for REGION 2 ----------------#

resource "aws_instance" "virginia_server" {
  provider = aws.virginia
  ami           = "ami-0dfcb1ef8550277af" # Amazon Linux in us-east-1
  instance_type = "t3.micro"

  user_data = <<-EOF
    #!/bin/bash
    sudo yum install -y nginx
    sudo systemctl enable nginx
    sudo systemctl start nginx
  EOF

  tags = {
    Name = "Virginia-Web-Server"
  }
}

