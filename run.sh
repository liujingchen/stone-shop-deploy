#!/bin/sh
set -x
PORT=$1
DATA_PATH=$2

docker run --name stone-shop -p $PORT:8080 -v $DATA_PATH:/data/db -d --restart unless-stopped `whoami`/stone-shop
