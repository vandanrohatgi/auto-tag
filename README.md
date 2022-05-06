When you create multiple EC2 instances from the same AMI on AWS you get the option to name the instances (using tags). But all the instances are named the same. You wont be able to differentiate one instance from another. Digital Ocean automatically detects if multiple droplets are being created and adds a "1", "2", "3" at the end of the name tag.

![](https://i.imgur.com/NJa8K5U.png)

![](https://i.imgur.com/qSSxpl0.png)

On AWS however there is no feature like this. So here is a simple script that takes the name of the current EC2 instances and renames them just like digital ocean. 

```
./tag.sh -t server

./tag.sh -h

./tag.sh -p nondefault -r us-east-1 -t server
```