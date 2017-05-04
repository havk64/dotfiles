#!/usr/bin/env bash
# Finds the github repo with more stars
# Pup is required in order to parse the links:
# $ go get github.com/ericchiang/pup

token=9f5400d5762cdca712e84b8c921cfa801c3dbeb6
user_agent='Holberton School' # or havk64
header="Authorization: token $token"
accept='Accept: application/vnd.github.v3+json'
dotfiles='http://dotfiles.github.io/'
output=result.out

mainpage() {
	# Extract valid github addresses using 'pup':
	curl -s "$dotfiles" | pup 'a[href] attr{href}' |
	# Match only valid github repositories:
	sed -nE '/https?:\/\/github.com\/[[:alnum:].-]+\/[[:alnum:].-]+\/?$/p' |
	# Fix schema url(https):
	sed -e '/^http:/s/http/https/g' |
	# Format the url to fetch each github repo page
	sed -e 's/https:../&api./g; s/github\.com\//&repos\//g; s/\/$//g'
}

fetch_stars()
{
	num_stars=$(curl -s -A "$user_agent" -H "$header" -H "$accept" "$1" |
	sed -E 's/.*stargazers_count":([[:digit:]]+).*/\1/')
	printf '%-60s\t%7s\n' "$1" "$num_stars"
}

while read -r line; do
	fetch_stars "$line" &
done <  <(mainpage) | sort -nrk 2 | uniq > "$output"

exit
