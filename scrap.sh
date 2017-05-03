#!/usr/bin/env bash
# Finds the repo with more stars

USER=
REPO=
token=9f5400d5762cdca712e84b8c921cfa801c3dbeb6
header="Authorization: token $token"
accept='Accept: application/vnd.github.v3+json'
addr=https://api.github.com
# dotfiles='http://dotfiles.github.io/'

# curl "$dotfiles" | pup 'a[href] attr{href}' | grep -r 'https?://github.com' > resources
sed -nr '/https:\/\/github.com\/[[:alpha:]]+\/[[:alpha:]]+$/p' github_users # 45 items of 91
sed -r 's/.*stargazers_count":([[:digit"]]+).*/\1/'

curl -H "$header" -H "$accept" "$addr/repos/""$USER"/"$REPO"
