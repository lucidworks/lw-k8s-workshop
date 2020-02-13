#!/bin/bash
gcloud auth configure-docker
IMAGE="us.gcr.io/${LW_K8S_GCP_PROJECT}/gatling-qps:${LW_K8S_NAMESPACE}"
docker tag "gatling-qps:${LW_K8S_NAMESPACE}" "${IMAGE}"
echo -e "\nPushing ${IMAGE} to GCP ..."
docker push "${IMAGE}"
