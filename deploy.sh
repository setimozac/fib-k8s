#!/bin/bash

docker build -t setimo/multi-client:latest -t setimo/multi-client:"${VERSION_SHA}" -f ./client/Dockerfile ./client
docker build -t setimi/multi-server:latest -t setimo/multi-server:"${VERSION_SHA}" -f ./server/Dockerfile ./server
docker build -t setimo/multi-worker:latest -t setimo/multi-worker:"${VERSION_SHA}" -f ./worker/Dockerfile ./worker

docker push setimo/multi-client:latest
docker push setimo/multi-client:"${VERSION_SHA}"

docker push setimo/multi-server:latest
docker push setimo/multi-server:"${VERSION_SHA}"

docker push setimo/multi-worker:latest
docker push setimo/multi-worker:"${VERSION_SHA}"

kubectl apply -f /k8s
