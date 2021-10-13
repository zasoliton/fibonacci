#!/usr/bin/env bash

TARGET=${1:-dev}
VERSION=$(cat app/VERSION)

echo "Building fib-dev:latest"
docker build --target dev -t fib-dev:latest -t fib-dev:$VERSION .

if [[ "x${TARGET}" = "xprod" ]]
then
    echo "Building fib:latest"
    docker build --target prod -t fib:latest -t fib:$VERSION .
fi
