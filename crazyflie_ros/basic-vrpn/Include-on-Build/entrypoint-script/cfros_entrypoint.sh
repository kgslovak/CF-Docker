#!/bin/bash
set -e

# setup ros environment
source "/CF_WS/devel/setup.bash"

exec "$@"
