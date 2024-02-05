virginia_cidr = "10.10.0.0/16"
#public_subnet = "10.10.2.0/24"
#private_subnet = "10.10.1.0/24"

subnets = [ "10.10.2.0/24","10.10.1.0/24" ]


tags = {
    "env" = "dev"
    "owner" = "Alejandro"
    "cloud" = "AWS"
    "IAC" = "Terraform"
    "IAC_Version" = "1.6.1"
    "project" = "cerberus"
    "region" = "virginia"
}

sg_ingress_cidr = "0.0.0.0/0"

ec2_specs = {
  "ami" = "ami-0df435f331839b2d6"
  "instance_type" = "t2.micro"
}

ingress_port_list = [ 22,80,443 ]