#!/usr/bin/env bash

timeout --signal INT 5h cargo hfuzz run $1
status=$?

if [ $status -eq 0 ]; then
  echo "Found a panic!"
  # TODO: provide Minimal Reproducible Input
  # TODO: message on Matrix
  exit 1
else
  echo "Didn't find any problem in 5 hours of fuzzing"
fi
