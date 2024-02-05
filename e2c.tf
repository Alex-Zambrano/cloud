# variable "instancias" {
#   description = "Nombre instancias"
#   type = list(string)
#   default = [ "apache", "mysql", "jumpserver" ]
  
# }
# #Ejemplo con COUNT
# resource "aws_instance" "public_instance" {
#   count =  length(var.instancias)
#   ami                     = var.ec2_specs.ami
#   instance_type           = var.ec2_specs.instance_type
#   subnet_id = aws_subnet.public_subnet.id
#   key_name = data.aws_key_pair.key.key_name
#   vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
#   user_data = file("userdata.sh")

#   tags = {
#     "Name" = var.instancias[count.index]
#     }

#   }

#Variable de instancias ppara for_each
variable "instancias" {
  description = "Nombre instancias"
  type = set(string)
  default = [ "apache", "mysql", "jumpserver" ]
  
}
#Ejemplo con FRO EACH
resource "aws_instance" "public_instance" {
  for_each =   var.instancias
  ami                     = var.ec2_specs.ami
  instance_type           = var.ec2_specs.instance_type
  subnet_id = aws_subnet.public_subnet.id
  key_name = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data = file("userdata.sh")

  tags = {
    "Name" = "${each.value}-${local.sufix}"
    }
}

  


#ami-0df435f331839b2d6

