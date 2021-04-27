#!/bin/sh

set -e

# Extract the base64 encoded config data and write this to the KUBECONFIG
echo "$KUBE_CONFIG_DATA" | base64 --decode > /tmp/config
export KUBECONFIG=/tmp/config

sh -c 'echo "::set-output name=kubectl_result::$(kubectl${KUBECTL_VERSION:+.${KUBECTL_VERSION}} $*)"'
