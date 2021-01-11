#!/bin/bash

set -e

envsubst < config_template.xml > config.xml

if [[ $EDP_KEY ]]; then
    echo "Generating auth/edp_key"
    echo $EDP_KEY | xxd -r -p > auth/edp_key
fi

if [[ $GET_AUTH_USER && $GET_AUTH_PWD ]]; then
    echo "Generating auth/passwd_get"
    $pwd_md5 = $(echo -n "$GET_AUTH_USER:spc-web-gateway:$GET_AUTH_PWD" | md5sum | awk '{print $1}')
    echo md5sum "$GET_AUTH_USER:spc-web-gateway:$pwd_md5" > auth/passwd_get
fi

if [[ $PUT_AUTH_USER && $PUT_AUTH_PWD ]]; then
    echo "Generating auth/passwd_put"
    $pwd_md5 = $(echo -n "$PUT_AUTH_USER:spc-web-gateway:$PUT_AUTH_PWD" | md5sum | awk '{print $1}')
    echo md5sum "$PUT_AUTH_USER:spc-web-gateway:$pwd_md5" > auth/passwd_put
fi

if [[ $WS_AUTH_USER && $WS_AUTH_PWD ]]; then
    echo "Generating auth/passwd_ws"
    $pwd_md5 = $(echo -n "$WS_AUTH_USER:spc-web-gateway:$WS_AUTH_PWD" | md5sum | awk '{print $1}')
    echo md5sum "$WS_AUTH_USER:spc-web-gateway:$pwd_md5" > auth/passwd_ws
fi

exec /opt/spc-web-gateway-ubuntu_x86_64.1.2/spc-web-gateway "$@"
