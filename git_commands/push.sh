cd $git_path
echo "1. Push a branch to your remote repository"
echo "2. Push changes to remote repository with branch name"
echo "3. Push changes to remote repository "
echo "4. Delete a remote branch"
read choice
case "$choice"
in
1)
  echo "Enter branch name"
  read branch_name
  git push origin "$branch_name"
  ;;

2)
  echo "Enter branch name"
  read branch_name
  git push -u  origin "$branch_name"
  ;;

3)
  git push
  ;;

4)
  echo "Enter branch name"
  read branch_name
  git push origin --delete "$branch_name"
  ;;
esac