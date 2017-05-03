#!/usr/bin/env bash
# Finds the repo with more stars

token=9f5400d5762cdca712e84b8c921cfa801c3dbeb6
user_agent='Holberton School' # or havk64
header="Authorization: token $token"
accept='Accept: application/vnd.github.v3+json'
dotfiles='http://dotfiles.github.io/'
tmpfile=github_parsed

# Extract valid github addresses:
curl "$dotfiles" | pup 'a[href] attr{href}' | grep -r 'https?://github.com' |
# Match only valid github repositories:
sed -nr '/https?:\/\/github.com\/[[:alnum:].-]+\/[[:alnum:].-]+\/?$/p' |
# Fix schema url(https):
sed -e '/http\b/s/http/https/g' > "$tmpfile"

sed -r 's/.*stargazers_count":([[:digit:]]+).*/\1/'

fetch_stars()
{
	num_stars=$(curl -s -A "$user_agent" -H "$header" -H "$accept" "$1" |
	sed -E 's/.*stargazers_count":([[:digit:]]+).*/\1/')
	printf '%s\n' "$num_stars"
}

while read -r line; do
	# grep 'nicksp' <<< "$line" &> /dev/null && stars=$(fetch_stars "$line")
	stars=$(fetch_stars "$line")
	printf '%s\t%s\n' "$line" "${stars-placeholder}";
done <  <(sed -e 's/https:../&api./g; s/github\.com\//&repos\//g; s/\/$//g' $tmpfile)
