#!/bin/bash
set -e

rm -f /vehicle_mgt/tmp/pids/server.pid

exec "$@"