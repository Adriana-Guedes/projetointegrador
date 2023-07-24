
#liberando grupo de segurança ssh

resource "aws_security_group" "sg_acesso_ssh_publico" {

  description = "Libera porta ssh pra internet"

  # regras de entrada
  ingress {
    # blocos de ips de acesso a maquina ( grupo de ip)
    cidr_blocks = [var.ip_internet]
    #da porta 22 para a porta 22 (entrada somente por ela)
    description = "Porta SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

   

  }
  # regras de saida
  egress {

    cidr_blocks = [var.ip_internet]
    description = "Porta SSH"
    # 0 pois pode ter qualquer porta de saida (80,9090 etc)
    from_port = 0
    to_port   = 0
    #todos os protocolos
    protocol = "-1"

  }

}


resource "aws_security_group" "sg_acesso_web" {

  //somente de entrada, pois a de saida já esta configurada acima (liberado para todas)
  ingress {

    cidr_blocks = [var.ip_internet]
    #da porta 22 para a porta 22 (entrada somente por ela)
    description = "Porta Web"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }




}

