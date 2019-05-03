#asks if you need to commit all files or particular files
echo 'Do you want to commit all files?  (y/n)'
read reply
while [ $reply != "y" -a $reply != "n" ]
do	
	echo "Enter y or n"
	read reply
	if [ $reply = 'y' -o $reply = 'n' ]; then
		break
	fi
done

if [ $reply = 'y' ]; then
	all=y
	source ./validation.sh "all"
elif [ $reply = 'n' ]; then
	echo "enter filename to commit.."
	read  file_name
	file_name=${file_name//' '/'\ '}
	all=n
	source ./validation.sh "$file_name"
fi

#enter the message to commit
echo "Enter message to commit"
read message
while [ -z "$message" ]
do
	echo "please enter the message"
	read message
done
#need to enter message with double quotes
# while [ ${message:0:1} != '"' ]
# do
# 	echo "please enter string with double quotes..."
# 	read message
# done
#check if need to commit all files
if [ $all = 'y' ]; then
	git commit -m "$message"
else
git commit "$file_name" -m "$message"
fi