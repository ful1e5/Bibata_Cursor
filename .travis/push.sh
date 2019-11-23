#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_build_files() {
  git checkout -b test
  git add . 
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin https://${GH_TOKEN}@github.com/KaizIqbal/Bibata_Cursor.git > /dev/null 2>&1
  git push --quiet --set-upstream origin test
}

setup_git
commit_build_files
upload_files