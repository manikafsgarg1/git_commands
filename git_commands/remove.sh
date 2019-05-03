cd $git_path
echo "Enter file name to remove"
read file_name
file_name=${file_name//' '/'\ '}
git rm -r "$file_name"