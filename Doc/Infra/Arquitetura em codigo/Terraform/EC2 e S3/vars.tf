
#VARIAVEIS

#chave  e valor (ami da máquina a ser criada da região us-east)
variable "amis" {
  default = {

    #AMI já é definido no "menu de instancias da AWS"
    /*informação em instancias na plataforma - lauch instancias,
        tera a ami de todas as máquinas) */

    "sa-east-1-ubuntu22.04" = "ami-0af6e9042ea5a4e3e"

  }
}


variable "instance_type" {
  default = {
    #maquina free tier eligbie ( tipo de máquina)
    "micro" = "t2.micro"
  }
}

//vai considerar todos os ip para saida
variable "ip_internet" {
  default = "0.0.0.0/0"

}