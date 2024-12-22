EFS  ( Elastic File storage )
Create two ec2 instances in different availability zones and a EFS s with ec2 sg NFS enabled 2049
- select EFS  - click view details - select attach - select Mount via IP - select Availability zone 
Connect to the ec2 instance in same availability zone

-  sudo -i
-  apt install amazon-efs-utils -y      -> Installed the efs utill package
-  mkdir efs                                       -> make folder for mounting