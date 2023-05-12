#!/bin/bash

# Define variables for directory names and branch names
dir1="./app/app"
dir2="./dev/app"
dir3="./test/app"
branch1="beside"
branch2="dev"
branch3="test"
repo="git@github.com:gniper/beside0.git"
current_dir=$(pwd)

# Clone the repo into each directory and checkout the desired branch
echo -e "\033[1;32mCloning repo and changing branch...\033[0m"
if [ ! -d "$dir1" ]; then
  echo -e "\033[1;33mDirectory '$dir1' does not exist, cloning repo and changing branch to '$branch1'...\033[0m"
  git clone "$repo" "$dir1"
  cd "$dir1"
  git checkout "$branch1"
  cd $current_dir
else
  echo -e "\033[1;33mDirectory '$dir1' already exists, skipping...\033[0m"
fi

if [ ! -d "$dir2" ]; then
  echo -e "\033[1;33mDirectory '$dir2' does not exist, cloning repo and changing branch to '$branch2'...\033[0m"
  git clone "$repo" "$dir2"
  cd "$dir2"
  git checkout "$branch2"
  cd $current_dir
else
  echo -e "\033[1;33mDirectory '$dir2' already exists, skipping...\033[0m"
fi

if [ ! -d "$dir3" ]; then
  echo -e "\033[1;33mDirectory '$dir3' does not exist, cloning repo and changing branch to '$branch3'...\033[0m"
  git clone "$repo" "$dir3"
  cd "$dir3"
  git checkout "$branch3"
  cd $current_dir
else
  echo -e "\033[1;33mDirectory '$dir3' already exists, skipping...\033[0m"
fi

echo -e "\033[1;32mDone!\033[0m"
