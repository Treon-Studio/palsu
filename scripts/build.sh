#!/bin/bash

# Exit on error
set -e

echo "🏗️  Building Bohongan..."

# Clean previous build
mix clean
rm -rf _build

# Get dependencies
echo "📦 Installing dependencies..."
mix deps.get

# Compile
echo "🔨 Compiling..."
MIX_ENV=prod mix compile

# Create release
echo "📦 Creating release..."
MIX_ENV=prod mix release

echo "✅ Build completed!"
echo "Run './scripts/start.sh' to start the server"
