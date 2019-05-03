#validates inside data of a file
file_validation () {
  arr=( "$@" )
  for i in "${arr[@]}"
  do
    file_name=""$git_path"$i"
    if [[ -f $file_name ]] ; then
      source /home/msys/Chef/Employee/SHELL_SCRIPTING/git_commands/regular_expression.sh
      data=$(grep -E "$access_key" "$file_name")
      if [[ -z "$data" ]]; then
        data=$(grep -E "$access_password" "$file_name")
      fi
      #if data is available then it doesnot commit
      if [[ "$data" ]]; then
        echo "$data"
        echo "Cannot commit. Access Key or password in $file_name"
        exit
      fi
    else
      echo "The file $file_name does not exist."
    fi
  done
}

#creates an array which contains the paths of the files to be committed
array () {
  declare -a arr=($(echo $1 | tr " " "\n"))

  #delete two elements from array if found
  delete=(new file:)

  for del in ${delete[@]}
  do
    arr=("${arr[@]/$del}")
  done

  #deletes space with in an array or null values
  set -f; IFS=
  var2=(${arr[@]})
  
  #calls file validation function
  file_validation "${var2[@]}"
}

cd $git_path
#if you need to commit all the files
if [ $1 = "all" ]; then
    files=$(git status | grep -i new)
else
  #if particular files have to be committed
	files=$1
fi

#substring to check if .chef directory is there in the path or not
substring=.chef
if [ "${files/$substring}" != "$files" ] ; then
	echo ".chef exists....Do you want to commit it? (yes/no)"
	read yes
fi

#if you need not to commit .chef directory
if [[ $yes = "no" ]]; then
	exit
fi
#if you have no issues in committing .chef directory
array "$files"
