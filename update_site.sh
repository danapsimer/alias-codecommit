#!/bin/bash
#set -x

DIR="$(cd "$(dirname "$0")"; pwd)"

if (( $# < 1 )); then
  echo "Usage: $0 <domain name> [<hosted zone>]"
  exit -1
fi

DOMAIN="${1}"
HOSTED_ZONE="${DOMAIN}."
if (( $# > 1 )); then
  HOSTED_ZONE="${2}"
fi
ID="${DOMAIN//./-}"
CF_URI=website-tools.bluesoftdev.com/alias_codecommit.yml

aws s3 cp "${DIR}/alias_codecommit.yml" "s3://${CF_URI}"

aws cloudformation update-stack --stack-name "${ID}" \
  --template-url "https://s3.amazonaws.com/${CF_URI}" \
  --parameters "ParameterKey=DomainName,ParameterValue=${DOMAIN}" \
      "ParameterKey=HostedZone,ParameterValue=${HOSTED_ZONE}"