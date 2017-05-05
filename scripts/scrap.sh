#!/usr/bin/env bash
# This script parses dotfile.github.io page for each github repo,
# fetches the amount of starts of each one and sorts in reverse order
# showing most starred repos first
#
# Pup is required in order to parse the links:
# $ go get github.com/ericchiang/pup

token="${GITHUB_TOKEN}" # Defined as an environment variable
user_agent=havk64
header="Authorization: token $token"
accept='Accept: application/vnd.github.v3+json'
dotfiles='http://dotfiles.github.io/'
output=result.out

mainpage() {
	# Extract valid github addresses using 'pup':
	curl -sL "$dotfiles" | pup 'a[href] attr{href}' |
	sed -nE '{
	# Match only valid github repositories:
	/https?:\/\/github.com\/[[:alnum:].-]+\/[[:alnum:].-]+\/?$/!d
	# Fix schema url(https):
	/^http:/s/http/https/
	# Format the url to fetch each github repo page using github API
	s/https:../&api./
	s/github\.com\//&repos\//
	s/\/$//g
	p
	}'

}

fetch_stars()
{
	response=$(curl -sLA "$user_agent" -H "$header" -H "$accept" "$1" |
	sed -E 's/.*stargazers_count":([[:digit:]]+).*/\1/')
	owner=$(sed -E 's/([^/]+)\/.*/\1/' <<< "${1:29}")
	repo=$(sed -E 's/[^/]+\/(.*)/\1/' <<< "${1:29}")
	printf '%-20s\t%-30s\t%7s\n' "$owner" "$repo" "$response"
}

printf -v head '%-20s\t%-30s\t%7s\n' "Owner" "Repository" "Number of Stars"

while read -r line; do
	fetch_stars "$line" &
done <  <(mainpage) | sort -nrk 3 | uniq |
# Insert the header before the first line
sed '1 i\'$'\n'"$head" # > "$output" # Optionally prints a report

exit
