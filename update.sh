#!/bin/bash
set -ev

# Fetch changes from main
git fetch origin --prune --prune-tags && git pull origin

# Fetch changes from upstream and merge to origin
git fetch upstream --prune --no-tags && git merge upstream/main && git push origin

# Build Docker container
docker build --platform linux/arm64/v8 -t claude-container-arm64 claude-code/

# Make script executable and create a symlink
chmod +x bin/claude-container && ln -sf "$(realpath bin/claude-container)" ~/.local/bin/claude
