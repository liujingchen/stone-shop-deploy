#!/bin/sh

mongod > /dev/null 2>&1 &
MONGO_PID=$!
trap 'kill -15 $MONGO_PID' EXIT
node app.js
