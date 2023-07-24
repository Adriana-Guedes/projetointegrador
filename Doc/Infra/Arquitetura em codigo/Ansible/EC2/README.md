# rodar playbook no ansible

ansible-playbook -i hots provisionar.yml -u ubuntu --private-key /home/adrianaalves/.ssh/dbooking

# acesso ssh da maquina
ssh -i /home/adrianaalves/.ssh/dbooking ubuntu@ec2-..... .computador-1.amazonaws.com