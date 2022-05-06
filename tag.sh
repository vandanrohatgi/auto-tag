#!/bin/bash

usage() { echo "Usage: $0 [-p profile] [-t tagname] [-r region]" 1>&2; exit 0; }

while getopts ":ht:p:r:" o; do
    case "${o}" in
        r)
            r=${OPTARG}
            ;;
        p)
            p=${OPTARG}
            ;;
        t)
            t=${OPTARG}
            ;;
        h | *)
            usage
            ;;
    esac
done

echo "Following instances will be renamed:"

temp_file=temp$RANDOM.txt
aws ec2 describe-instances --filters Name=tag:Name,Values=$t --query "Reservations[].Instances[].InstanceId" --region $r --profile $p --output text | tee $temp_file


if [ ! -s $temp_file ]
then
    echo "No instances found with that name"
    rm $temp_file
    exit 0
fi

echo "Type 'yes' to proceed. (only 'yes' will work as the approval)"

read enter

if [ $enter != 'yes' ]
then
    echo "Enter 'yes' to proceed"
    rm temp_file
    exit 0
fi

count=1
for i in $(cat $temp_file)
do
    aws ec2 create-tags --resources $i --tags Key=Name,Value=$t$count --profile $p --region $r
    ((count=$count+1))
done

rm $temp_file

echo "Instances Renamed!"

