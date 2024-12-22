EFS  ( Elastic File storage )
Create two ec2 instances in different availability zones and a EFS s with ec2 sg NFS enabled 2049
- select EFS  - click view details - select attach - select Mount via IP - select Availability zone 
Connect to the ec2 instance in same availability zone

-  sudo -i
-  apt install amazon-efs-utils -y      -> Installed the efs utill package
-  mkdir efs                                       -> make folder for mounting

-  copy the command from the efc connect console and paste and enter
-  mount -s|grep efs                          -> mounted the EFS to efs folder
-  sudo chmod 777 efs                      -> change permision for efs folder
-  ll   
-  cd efs                                             -> list all file with permisions
-  touch file {1..6}                             -> make 6 files with file1, file2 and so on

For second Instance 
- select EFS  - click view details - select attach - select Mount via IP - select Availability zone 
Connect to the ec2 instance in same availability zone
-  sudo -i
-  apt install amazon-efs-utils -y      -> Installed the efs utill package
-  mkdir efs                                       -> make folder for mounting
-  