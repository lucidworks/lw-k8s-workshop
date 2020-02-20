#!/bin/bash
gcloud auth configure-docker
IMAGE="us.gcr.io/${LW_K8S_GCP_PROJECT}/gatling-qps:lab4"
docker tag "gatling-qps:lab4" "${IMAGE}"
echo -e "\nPushing ${IMAGE} to GCP ..."
docker push "${IMAGE}"
