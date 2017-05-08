#!/usr/bin/env bash
# This script parses dotfile.github.io page and extracts all github repo,
# fetches the amount of stars in each one and sorts it in reverse order
# showing most starred repos first.
#
# Pup is required in order to parse the links:
# $ go get github.com/ericchiang/pup

token="${GITHUB_TOKEN}" # Defined as an environment variable
user_agent=havk64
header="Authorization: token $token"
accept='Accept: application/vnd.github.v3+json'
dotfiles='http://dotfiles.github.io/'
formatting='%-20s\t%-20s\t%7s\t\t%s\n'
output=result.out

mainpage() {
	# Extract urls from html using 'pup':
	curl -sL "$dotfiles" | pup 'a[href] attr{href}' |
	# Parses and filter github addresses
	sed -nE '{
	# Match only valid github repositories:
	/https?:\/\/github.com\/[[:alnum:].-]+\/[[:alnum:].-]+\/?$/!d
	# Format the url to fetch each github repo page using github API
	s/(https:..)(github\.com\/)/\1api.\2repos\//
	p
	}'
}

fetch_stars()
{
	# Fetches each github repo information and extracts the number of stars
	response=$(curl -sLA "$user_agent" -H "$header" -H "$accept" "$1" |
	sed -E 's/.*stargazers_count":([[:digit:]]+).*/\1/')
	owner=$(sed -E 's/([^/]+)\/.*/\1/' <<< "${1:29}")
	repo=$(sed -E 's/[^/]+\/(.*)/\1/' <<< "${1:29}")
	URL="https://github.com/${1:29}"
	printf "$formatting" "$owner" "$repo" "$response" "$URL"
}

# Assing to 'head' variable the format of output(similar to sprintf)
printf -v head "$formatting" "Owner" "Repository" "Number of Stars" "URL"

# Parses/fetches each github repo in sequence(using process substitution) async
while read -r line; do
	fetch_stars "$line" &
done <  <(mainpage) | sort -nrk 3 | uniq |
# Insert the header before the first line
sed -n "
1 i\\
$head
p" # > "$output" # Optionally prints a report

exit
