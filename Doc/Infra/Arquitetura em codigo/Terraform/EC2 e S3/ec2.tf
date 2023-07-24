

#um recurso ec2 "o tipo do servico " "nome que apenas o terraform vai enchercar"
resource "aws_instance" "nome_recurso_terraform" {
  #informando com a variavel qual é o ami e o nome da chave
  ami = var.amis["sa-east-1-ubuntu22.04"]

  instance_type = var.instance_type.micro
  key_name = "dbooking"

    associate_public_ip_address = true

  #nome da máquina
  tags = {
    "Name" = "digital_booking"
  }


  // vinculação do grupo de segurança com o recurso
  vpc_security_group_ids = [aws_security_group.sg_acesso_ssh_publico.id, aws_security_group.sg_acesso_web.id]
  // id da subnet
  subnet_id = "subnet-0841b8ac408b71c72"


  #-EOF= final do arquivo ( o script no final da criação da instancia )
  #dados o usuario
  user_data = <<-EOF
    #!/bin/bash 
    sudo apt update
    sudo apt install apache2-4

    EOF
}
