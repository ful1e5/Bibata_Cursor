#!/bin/sh

setup_git() {
  git config --global user.email "$USER_EMAIL"
  git config --global user.name "$USER_NAME"
}

commit_build_files() {
  git checkout -b test
  git add . 
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin https://KaizIqbal:${GH_TOKEN}@github.com/KaizIqbal/Bibata_Cursor.git > /dev/null 2>&1
  git push --quiet --set-upstream origin test
}

setup_git
commit_build_files
upload_files