#!/bin/bash

# Grant execute permissions to the script
chmod +x ./.devcontainer/postCreate.sh

# Accept Android SDK licenses
yes | sdkmanager --licenses

# Update SDK components
sdkmanager --update
