# SPC Web Gateway Docker image
## Building
Put the SPC Web Gateway installation tarball (`spc-web-gateway-ubuntu_x86_64.1.2.tar.gz`) in the build directory. The version is currently hardcoded.

## Environment variables
| Name  | Comment  | Default  |
|---|---|---|
| EDP_KEY  | EDP encryption key, in hex format (32 characters)  | N/A  |
| GET_AUTH_USER  || |
| GET_AUTH_PWD  || |
| PUT_AUTH_USER |   ||
| PUT_AUTH_PWD  |  ||
| WS_AUTH_USER  | ||
| WS_AUTH_PWD  | ||
| ENABLE_GET_AUTH  || yes|
| ENABLE_PUT_AUTH  || yes|
| ENABLE_WS_AUTH  || yes |
| ENABLE_EDP_ENCRYPTION  || yes |
| ENABLE_SSL_ENCRYPTION  || yes |
| ACL  || +0.0.0.0/0 |
| SPC_ID  |||
| GATEWAY_ID  |||
| SPC_TIME_DIFF || 0 |
| SPC_DST || yes |
