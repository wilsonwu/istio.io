#!/usr/bin/env bash
# shellcheck disable=SC1090,SC2154

# Copyright Istio Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e
set -u
set -o pipefail

GATEWAY_API="${GATEWAY_API:-false}"

# @setup profile=default

kubectl label namespace default istio-injection- --overwrite

# Generate client and server certificates and keys
snip_generate_client_and_server_certificates_and_keys_1
snip_generate_client_and_server_certificates_and_keys_2

# Deploy an NGINX server
snip_deploy_an_nginx_server_1

snip_deploy_an_nginx_server_2

snip_deploy_an_nginx_server_3

snip_deploy_an_nginx_server_4

# waiting for nginx deployment to start
_wait_for_deployment default my-nginx

# validate NGINX server was deployed successfully
_verify_contains snip_deploy_an_nginx_server_5 "subject: CN=nginx.example.com"

# configure an ingress gateway
if [ "$GATEWAY_API" == "true" ]; then
    snip_configure_an_ingress_gateway_2
    _wait_for_gateway default mygateway

    snip_configure_an_ingress_gateway_4
    snip_configure_an_ingress_gateway_5

    echo "addr: ${INGRESS_HOST}:${SECURE_INGRESS_PORT}"
else
    snip_configure_an_ingress_gateway_1
    snip_configure_an_ingress_gateway_3

    # wait for configuration to propagate
    _wait_for_resource gateway default mygateway
    _wait_for_resource virtualservice default nginx

    _set_ingress_environment_variables
fi

# validate the output
_verify_contains snip_configure_an_ingress_gateway_6 "SSL certificate verify ok."

# @cleanup
if [ "$GATEWAY_API" != "true" ]; then
    snip_cleanup_1
    snip_cleanup_3
    snip_cleanup_4
    kubectl label namespace default istio-injection-
fi
