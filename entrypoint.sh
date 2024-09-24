#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Configure the runner
./config.sh --url $RUNNER_REPO_URL --token $RUNNER_TOKEN --name $(hostname) --work _work --unattended --replace

# Run the runner
./run.sh
