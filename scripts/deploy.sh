#!/usr/bin/env bash

set -eo pipefail

# import the deployment helpers
. $(dirname $0)/common.sh

# Deploy.
VibesAddr=$(deploy Vibes)
log "Vibes deployed at:" $VibesAddr
