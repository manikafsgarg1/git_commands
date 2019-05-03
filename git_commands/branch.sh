cd $git_path
echo "1.  List branches"
echo "2.  List all branches"
echo "3.  Create a new branch"
echo "4.  Delete a branch"
echo "5.  Delete a remote branch"
echo "6.  Create a new branch and switch to it"
echo "7.  Switch to a branch"
echo "8.  Switch to the branch last checked out"
echo "9.  Discard changes to a file"
echo "10. Merge a branch into the active branch"
echo "11. Merge a branch into a target branch"
read choice
case "$choice"
in 
1)
  git branch
  ;;

2)
  git branch -a
  ;;

3)
  echo "ENTER BRANCH NAME"
  read branch_name
  git branch "$branch_name"
  ;;

4)
  echo "Enter branch to delete"
  read branch_name
  git branch -d "$branch_name"
  ;;

5)
  echo "Enter branch to delete"
  read branch_name
  git push origin --delete "$branch_name"
  ;;

6)
  echo "Enter branch name"
  read branch_name
  git checkout -b "$branch_name"
  ;;

7)
  echo "Enter branch name"
  read branch_name
  git checkout "$branch_name"
  ;;

8)
  git checkout -
  ;;

9)
  echo "Enter File name"
  read file_name
  git checkout -- "$file_name"
  ;;

10)
  echo "Enter branch name"
  read branch_name
  git merge "$branch_name"
  ;;

11)
  echo "Enter source branch"
  read source_name
  echo "Enter target branch"
  read target_name
  git merge "$source_name" "$target_name"
  ;;
esac