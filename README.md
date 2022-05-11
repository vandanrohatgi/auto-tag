When you create multiple EC2 instances from the same AMI on AWS you get the option to name the instances (using tags). But all the instances are named the same. You wont be able to differentiate one instance from another. You can use instance ID to do that but they aren't very human friendly. Digital Ocean automatically detects if multiple droplets are being created and adds a "1", "2", "3" at the end of the name tag.

![](https://i.imgur.com/54vjgB2.png)

![](https://i.imgur.com/oUHekSU.png)

On AWS however there is no feature like this. So here is a simple bash script that takes the name of the current EC2 instances and renames them just like digital ocean. 

![](https://i.imgur.com/uZdhsiJ.png)

```
./tag.sh -t server

./tag.sh -h
Usage: ./tag.sh [-p profile] [-t tagname] [-r region]

./tag.sh -p nondefault -r us-east-1 -t server
```