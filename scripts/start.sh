#!/bin/bash

# Exit on error
set -e

# Default port
PORT=${PORT:-4000}

echo "🚀 Starting Bohongan on port $PORT..."

# Run the release
_build/prod/rel/bohongan/bin/bohongan start
