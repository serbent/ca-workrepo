#~/bin/bash
# Create a new file and make 20 commits
for i in {1..20}; do
  echo "This is content for commit number $i." > file_$i.txt
  git add file_$i.txt
  git commit -m "Add file_$i.txt with content for commit $i"

  # Modify every even-numbered file
  if (( i % 2 == 0 )); then
    echo "This is an update for file_$i.txt." >> file_$i.txt
    git add file_$i.txt
    git commit -m "Update file_$i.txt for commit $i"
  fi

  # Optionally delete a file to add variety
  if (( i % 3 == 0 )); then
    rm file_$((i-1)).txt
    git add .
    git commit -m "Delete file_$((i-1)).txt for commit $i"
  fi
done
