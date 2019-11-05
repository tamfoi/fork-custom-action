# Script Path -> $sh
# Parameters -> ShellScriptPath $SHA

old_commit_id=$1
new_commit_id=HEAD

repository_absolute_path=`git rev-parse --show-toplevel`
repository_name=`basename $repository_absolute_path`
current_time=`date +%Y%m%d%H%M%S`

copy_target_absolute_path=${HOME}/desktop/${repository_name}-${current_time}

diff_list=`git diff --name-only --diff-filter=ACMRTUXB $old_commit_id $new_commit_id`
for file_path in $diff_list
do
  directory_path=`dirname $file_path`
  mkdir -p $copy_target_absolute_path/$directory_path
  git show $new_commit_id:$file_path > $copy_target_absolute_path/$file_path
done