#!/usr/bin/env bash

if [ ! -d "bin/ec2.py" ]; then
    wget https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.py -O bin/ec2.py
    chmod +x bin/ec2.py
    cp bin/ec2.py ../etc/ansible/ec2.py
    wget https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.ini -O bin/ec2.ini
    cp bin/ec2.ini ../etc/ansible/ec2.ini
fi

export ANSIBLE_HOSTS=$PWD/etc/ansible/ec2.py
export EC2_INI_PATH=$PWD/etc/ansible/ec2.ini
export PEM_FILE=${HOME}/.ssh/aws_poc.pem

echo export ANSIBLE_HOSTS="$PWD/bin/ec2.py"
echo export EC2_INI_PATH="$PWD/bin/ec2.ini"
echo export PEM_FILE="${HOME}/.ssh/aws_poc.pem"
#echo source bin/ec2-env.sh

echo "Start up a new agent and load the identity"
ssh-agent bash
ssh-add $PEM_FILE
echo "Show all names in the dynamic EC2 inventory"
bin/ec2.py --list
#echo "Use ansible to ping EC2 instance named cassandra_node"
#echo ansible -m ping tag_Name_cassandra_node
