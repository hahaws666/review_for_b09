#!/bin/bash

# Check if any arguments were passed
if [ $# -eq 0 ]; then
  echo "No PIDs provided. Please provide at least one PID."
  exit 1
fi

# Function to list file descriptors for a PID
list_fds() {
  pid=$1
  if [ ! -d /proc/$pid/fd ]; then
    echo "Process with PID $pid is not running or you do not have access."
    return
  fi
  echo "Listing file descriptors for PID $pid:"
  ls -l /proc/$pid/fd
}

# Iterate over all PIDs provided as arguments
for pid in "$@"; do
  list_fds $pid
done
