#!/bin/bash
set -e

rm -f /lekki-property-service/tmp/pids/server.pid

exec "$@"