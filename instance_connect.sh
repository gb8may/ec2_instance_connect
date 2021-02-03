#!/bin/bash

#
# Author: Mayara Gouveia
#

if [ "$1" == "-h" ]; then
  echo "##########################"
  echo " AWS EC2 Instance Connect "
  echo "##########################"
  echo ""
  echo "To connect using AWS Instance Connect, be sure id_rsa and id_rsa.pub are in the current directory."
  echo ""
  echo "##########################"
  echo ""
  echo "USAGE: ./instance_connect.sh instance_name"
  echo ""
  exit 0
fi

aws ec2 describe-instances --filters Name=tag-key,Values=Name --query 'Reservations[*].Instances[*].{IP:PublicIpAddress,Instance:InstanceId,AZ:Placement.AvailabilityZone,Name:Tags[?Key==`Name`]|[0].Value}' --output table > db.txt

if [ $# -lt 1 ]; then
echo "Usage: $0"
exit 1
fi

grep -i "$1" db.txt > tmp.txt
az=$(cut -c4-13 tmp.txt)
ip=$(cut -d " " -f5 tmp.txt)
cut -d "i" -f2 tmp.txt > tmp2.txt
id=$(cut -c1-18 tmp2.txt)
rm tmp* db.txt

aws ec2-instance-connect send-ssh-public-key \
    --instance-id i$id \
    --availability-zone $az \
    --instance-os-user ubuntu \
    --ssh-public-key file://id_rsa.pub

echo "Connecting to i$id......."

ssh -o "StrictHostKeyChecking no" -o "IdentitiesOnly=yes" -i id_rsa ubuntu@$ip
