#!/bin/bash
version=${1:-1.25}

echo $version

curl -ko cluster-example.yaml https://cloudnative-pg.io/documentation/${version}/samples/cluster-example.yaml
