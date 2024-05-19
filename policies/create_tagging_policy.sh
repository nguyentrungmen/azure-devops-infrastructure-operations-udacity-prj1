#!/bin/bash
subscription="$AZ_SUBCRIPTION_ID"
policyName="tagging-policy"

MSYS_NO_PATHCONV=1 az policy definition create \
  -n $policyName \
  --rules ./tagging-policy.json \
  --params ./policy-definition-params.json \
  --display-name "Require a tag on resources" \
  --description "Enforces a required tag and its value. Does not apply to resource groups." \
  --subscription "$subscription"

MSYS_NO_PATHCONV=1 az policy assignment create \
  -n $policyName \
  --policy $policyName \
  --params ./policy-assignment-params.json \
  --display-name "Require a tag on resources" \
  --description "Enforces a required tag and its value. Does not apply to resource groups." \
  --scope "/subscriptions/$subscription"