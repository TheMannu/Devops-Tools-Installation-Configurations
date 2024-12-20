EBS - Elastic Block Storage
1) We can create an EBS in  SAN (Storage Area Network) and can be mounted on our machine using network that can be further used by the machine as storage
2) In Windows EBS is C drive and in Linux it is known as Root Volume
3) The OS is installed on root volume (EBS) that is attached to ec2 using SAN
4) Read write operations on ebs do faces latency but is highly negligible.
5) One comupte machine or ec2 can have multiple EBS volumes attached to it and even if the machine goes down the volume will keep the data stored as persistent storage 

6) Specific types of EBS (Io2 and Io1) can be attached with multiple EC2 instances 
7) EBS and EC2 instance should be in same AZs then only it can be attached
8) Size of EBS can be increased without stopping the instance but can not be decreased as downgrading in not allowed 
9) We can move EBS from one AZ to another AZ by taking backup as Snapshot

10) Instance can be created with root as instance store in this case data gets deleted even if the instance is stoped or restarted 
11) So Instance Store as EBS when data is needed to be temporary but the fastest read write operations and further not required 
12) Whenever we create an EBS volume the AWS by default creates a replica and if any thing happens to the EBS the it automatically connects to the replica ebs

13) For adding an EBS to the Instance We need to Create an EBS volume in same AZ and then select -Click Actions - Attach volume - 
check with 
- lsblk                                               -> to check all the block storages 
- sudo mkfs.ext4  /dev/xvdf             -> to format the EBS storage
- or - sudo !!                                       ->  !! is to run the above command
- sudo mkdir /test                             -> to create a folder that will be attached with ebs volume 
- sudo mount  /dev/xvdf  /test/         -> to mount the volume to the test folder
- mountpoint  /test                            -> to chech if it has been mounted


To remove the EBS volume from the instance 
- umount  /test/
Now it can be detached from ec2 instances using AWS console 

Now if we want to attach same EBS with another Instantance in same AZ the can be attached to instance from the console

- lsblk                                              -> to check is the EBS is attached to the instance

But do not format as formating can loose all the data inside the EBS 

- file -s  /dev/xvdf  or     df -Th           ->  else check the file system inside the EBS

so again to mount to this instance we will create another mount point and then mount 
- mkdir /data
- mount  /dev/xvdf  /data
- cd /data/
- ls          -> will show the existing data on the EBS volume


Resize the EBS Volumes and file system
- select the volume to resize 
- click action  -  modify volume - increse to desired size
- in cli check  -  lsblk      -> it shows the increased ebs volme
- but -  df -h                     ->   does not show  the increased volume as the incresed size in not formated 
- resize2fs  /dev/xvdf      ->  it will format the incresed volume also

Making EBS as Root Volume

Trick to decrese the EBS volume
- attache a new volume with smaller size 
- copy the data from larger volume to smaller volume 
- unmount the larger volume and 
- mount the smaller volume to the same folder


Resize the Root EBS Volumes and file system
- select the root volume to resize
- click action  -  modify volume - increase to desired size
- Inside CLI check  -  lsblk        -> it shows the increased Root EBS Volume
- But  -  df -h                              -> this does not shows the incresed volume as it is not formated as per previous attached volume
- To check   -  sudo file -s /dev/xvda1   (  df -Th   can also be used to cehck file format)  -> File Format of  Previous formated file or 
- To check file system  -  sudo fdisk -l /dev/nvme0n1
- Run  -  sudo growpart  /dev/xvda 1      (growpart /dev/nvme0n1 1)  -> the partions has been grown to this file format  (If file system is xfs  -  then  -  xfs_growfs)
- Run  -  resize2fs  /dev/xvda1                -> Now the complete EBS volume is formated 
- Check with   -  df -h                             -> Now the increased vole of EBS is visible 


Attache an EBS volume to multiple EC2
- Create the EBS Volume of desired Sizethat u want to attach with Multiple EC2 instances
- The EBS volumes should Support Multi Attache and also should be Enabled such as "Io1 & Io2"
- The EC2 Instances must on "Nitro" hypervisor systems  Rather then "xen" hypervisors (do check the EC2 instance types online for Nitro system instance types)
-  If the instance is not on Nitro system then stop the instance and change to Nitro types 
   -  Select the instance from console 
   -  Select - action - Instance Setting - Change Instance Type - Select the Nitro type instance - Apply 
   -  Restart the machines 
- Now Attach the ebs Volume with All the Insatnce Using AWS console
- Now Connect to the EC2 instaces CLI and Check with lsblk
- And the File System be should be Cluster aware   that need to be formated on EBS for usability (as exe4 or xfs might not work over here)

Types of EBS Volems
-  
Volume type                       	      gp3        	       gp2       	          io2 Block Express 3      	      io1        
Volume size	                                  1 GiB - 16 TiB	                   4 GiB - 64 TiB 4	             4 GiB - 16 TiB
Max IOPS	                    16,000 (64 KiB I/O 6)	   16,000 (16 KiB I/O 6)	    256,000 5 (16 KiB I/O 6)	    64,000 (16 KiB I/O 6)
Max throughput	                    1,000 MiB/s	         250 MiB/s 1	             4,000 MiB/s	                1,000 MiB/s 2
Amazon EBS Multi-attach	                   Not supported	                                         Supported
NVMe reservations	                    Not supported	                            Supported	                   Not supported

- https://docs.aws.amazon.com/ebs/latest/userguide/ebs-volume-types.html


Snapshot
Snapshots are used as backup of the current configuration of databases or EBS volumes and is stored in S3 in a dedicated region
Snapshots can be used to create a EBS volume of same configuration in different in different region or availability Zone 
Snapshots takes Backups in incremental manner


Lifecycle Manager
Life CYcle is used for taking the snapshots on a regular intervel based on Lifecycle manager policy defined by us.

Recycle Bin
Recycle is just to keep the deleted snapshots up to user defined retaintion periods

Copy snapshots and move to another region
Select The Snapshot - Action - Copy snapshot - Select the Region - Click Copy Snapshot

Encryption of Snapshot
If the source snapshot is already encrypted or is account default to encryption the copy will also be encrypted and cannot be changed
If the EBS is encrypted then the data in transit is also encrypted 
Snapshot of the EBS will also get encrypted
and volume from that snapshot will also be encryted
while sharing encryted snapshot with another account we need to have permission to use KMS key associated with it 
we can make encryption enabled by default from EC2 console setting
we can make encryption enabled while taking the snapshots
we can enable encryption while copying the snapshot
but once the EBS or Snapshot is encrypted it can not be unencrypted an any stage