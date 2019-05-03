cd $git_path
echo "1. Update local repository to the newest commit"
echo "2. Pull changes from remote repository"
read choice
case "$choice"
in
1)
  git pull
  ;;

2)
  echo "Enter branch name"
  read branch_name
  git pull origin "$branch_name"
  ;;
esac