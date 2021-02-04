# AWS EC2 Instance Connect

Amazon [EC2 Instance Connect](https://aws.amazon.com/about-aws/whats-new/2019/06/introducing-amazon-ec2-instance-connect/) is a simple and secure way to connect to your instances using Secure Shell (SSH). With EC2 Instance Connect, you can control SSH access to your instances using AWS Identity and Access Management (IAM) policies as well as audit connection requests with AWS CloudTrail events.

![ec2-ic](https://user-images.githubusercontent.com/35708820/106826260-90f20c00-6654-11eb-8758-8a4ed526d25b.png)
 
Configure your host to use [EC2 Instance Connect](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-connect-set-up.html)

---------------------------------------------------

To connect using AWS Instance Connect, be sure your keys "id_rsa" and "id_rsa.pub" are in the current directory.

**USAGE:** 
```
./instance_connect.sh instance_name
```
