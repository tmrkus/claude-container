#!/bin/bash
set -ev

git fetch origin --prune --prune-tags
git pull origin
docker build --platform linux/arm64/v8 -t claude-container-arm64 claude-code/
chmod +x bin/claude-container
ln -sf "$(realpath bin/claude-container)" ~/.local/bin/claude-container
