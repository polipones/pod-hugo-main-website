#! /bin/bash

prefix="POD_web_fetch_contacts: "
api_url="https://hydra.pod.cvut.cz/api/v2/users/roles"

script_dir=$(dirname "$(readlink -f "$0")")

echo "Fetching contacts from Hydra..."

cd "$script_dir" || exit

max_retry=3
counter=0

until response=$(wget -q -O - "$api_url")
do
   sleep 1
   [[ counter -eq $max_retry ]] && echo "Failed!" && exit 1
   echo "Trying again. Try #$counter"
   ((counter++))
done

response_code=$(echo "$response" | jq -r '.code')

if [[ "$response_code" == "200" ]]; then
    if [[ ! -d "../data" ]]; then
        mkdir ../data
    fi
    echo "$response" > ../data/contacts.json
    echo "Fetching succesful"
else
    echo "${prefix}Response code from Hydra is not 200: $response_code"
    echo "${prefix}$response"
fi
