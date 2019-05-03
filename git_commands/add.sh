cd $git_path
#asks if need to add all files or not
echo 'Do you want to add all files?  (y/n)'
read reply
if [ $reply = 'y' ]; then
git add .
elif [ $reply = 'n' ]; then
echo "These files are available to add..."
#shows the files
git status
echo "enter filename to be added.."
read  file_name
git add "$file_name"
else
echo "Enter y or n"
fi