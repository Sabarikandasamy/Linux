#!/usr/bin/env bash
echo "Starting script..."
echo "Current directory: $(pwd)"
echo "Listing files:"
ls -la
echo "Printing a sample message:"
printf "Hello from Jenkins Task-2!\n"
# simulate some work and exit code 0
sleep 1
echo "Done."