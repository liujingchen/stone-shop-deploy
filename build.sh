#!/bin/sh

set -x
docker build -t `whoami`/stone-shop -f Dockerfile .
