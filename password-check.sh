#!/bin/bash

set -euo pipefail

# Get all entries from the shadow database
shadow_entries=$(getent shadow)

# Check if the getent command succeeded
if [ -z "$shadow_entries" ]; then
    echo "Unable to read from /etc/shadow."
    exit 1
fi

# Print all usernames and their hashed passwords
echo "$shadow_entries" | while IFS=: read -r username hashed_password rest; do
    IFS='$' read -r -a parts <<< "$hashed_password"
    nparts="${#parts[@]}"
    if [[ $nparts -eq 4 ]] ; then
        algo="${parts[1]}"
        salt="${parts[2]}"

        testpw=$(openssl passwd "-$algo" -salt "$salt" "$username")
        if [[ "$hashed_password" == "$testpw" ]] ; then
            userinfo=$(getent passwd "$username")
            IFS=':' read -r -a parts <<< "$userinfo"
            shell="${parts[6]}"

            echo "$username's password is the username"
            if [[ "$shell" == "/sbin/nologin" ]] ; then
                echo " ... but the shell is $shell so that should be less bad";
            fi
        fi
    fi
done
