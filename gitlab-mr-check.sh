#!/bin/bash

#########################################################

# NOTE: Get it from gitlab
PRIVATE_TOKEN='[YOUR PRIVATE TOKEN]'

# NOTE: Get it from your project's setting page
PROJECT_ID='[YOUR PROJECT ID]'

# NOTE: URL should start from `[https|http]://`
# It should be like `https://gitlab.com`
PROJECT_BASE_URL='[YOUR PROJECT BASE URL]'

# NOTE: Directory should be `my-project/product1`
PROJECT_DIRECTORY='[YOUR PROJECT DIRECTORY]'

# It should be `httsp://gitlab.com/my-project/product1`
PROJECT_URL="${PROJECT_BASE_URL}/${PROJECT_DIRECTORY}"

#########################################################

# Get MR titles which you are assigned to
main() {
    curl_response=$(curl -s --request GET --header "PRIVATE-TOKEN: ${PRIVATE_TOKEN}" ${PROJECT_BASE_URL}/api/v4/projects/${PROJECT_ID}/merge_requests)

    assigned_mrs=$(echo "${curl_response}" | jq '.[] | select(.assignee.name == "blue0513")')

    # Filter Closed
    active_assigned_mrs=$(echo "${assigned_mrs}" | jq 'select(.state == "opened")')
    mr_titles=$(echo "${active_assigned_mrs}" | jq -r .title)

    for ((i = 0; i < ${#mr_titles[@]}; i++))
    do
	# Filter WIP
	if [[ "${mr_titles[$i]}" != "WIP"* ]]; then
	    echo "${mr_titles[$i]}"
	fi
    done
}

[[ "${BASH_SOURCE[0]}" == "$0" ]] && main "$@"
