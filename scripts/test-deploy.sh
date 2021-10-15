#!/usr/bin/env bash

set -eo pipefail

# bring up the network
. $(dirname $0)/run-temp-testnet.sh

# run the deploy script
. $(dirname $0)/deploy.sh

# get the address
addr=$(jq -r '.Vibes' out/addresses.json)

# the total supply should start at 0
supply=$(seth call $addr 'totalSupply()(uint256)')
[[ $supply = 0 ]] || error

echo "Success."
