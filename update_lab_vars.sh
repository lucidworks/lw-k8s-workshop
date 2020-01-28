#!/bin/bash

SCRIPT_CMD="$0"

GCLOUD_PROJECT=
NAMESPACE=

function print_usage() {
  CMD="$1"
  ERROR_MSG="$2"

  if [ "$ERROR_MSG" != "" ]; then
    echo -e "\nERROR: $ERROR_MSG"
  fi

  echo -e "\nUse this script to update lab commands for your namespace"
  echo -e "\nUsage: $CMD [OPTIONS] ... where OPTIONS include:\n"
  echo -e "  -p            GCP Project ID (required)\n"
  echo -e "  -n            Kubernetes namespace (required)\n"
}

if [ $# -gt 0 ]; then
  while true; do
    case "$1" in
        -n)
            if [[ -z "$2" || "${2:0:1}" == "-" ]]; then
              print_usage "$SCRIPT_CMD" "Missing value for the -n parameter!"
              exit 1
            fi
            NAMESPACE="$2"
            shift 2
        ;;
        -p)
            if [[ -z "$2" || "${2:0:1}" == "-" ]]; then
              print_usage "$SCRIPT_CMD" "Missing value for the -p parameter!"
              exit 1
            fi
            GCLOUD_PROJECT="$2"
            shift 2
        ;;
        -help|-usage|--help|--usage)
            print_usage "$SCRIPT_CMD"
            exit 0
        ;;
        --)
            shift
            break
        ;;
        *)
            if [ "$1" != "" ]; then
              print_usage "$SCRIPT_CMD" "Unrecognized or misplaced argument: $1!"
              exit 1
            else
              break # out-of-args, stop looping
            fi
        ;;
    esac
  done
fi

if [ "$NAMESPACE" == "" ]; then
  print_usage "$SCRIPT_CMD" "Please provide the GKE namespace using: -n <namespace>"
  exit 1
fi

if [ "$GCLOUD_PROJECT" == "" ]; then
  print_usage "$SCRIPT_CMD" "Please provide the GCP project name using: -p <project>"
  exit 1
fi

CLUSTER="${GCLOUD_PROJECT}-trng"
ZONE="us-west1"
HOSTNAME="${NAMESPACE}.lucidworkssales.com"
if [ "${GCLOUD_PROJECT}" == "proserve" ]; then
  HOSTNAME="${NAMESPACE}.lucidworksproserve.com"
  ZONE="us-central1"
fi

declare -a labs=("lab1" "lab2" "lab3" "lab4" "lab5" "lab6")
for i in "${labs[@]}"
do
  next="${i}/README.adoc"
  sed -i ''  -e "s|<NAMESPACE>|${NAMESPACE}|g" $next
  sed -i ''  -e "s|<HOSTNAME>|${HOSTNAME}|g" $next
  sed -i ''  -e "s|<RELEASE>|${NAMESPACE}|g" $next
  sed -i ''  -e "s|<CLUSTER>|${CLUSTER}|g" $next
  sed -i ''  -e "s|<GCLOUD_PROJECT>|${GCLOUD_PROJECT}|g" $next
  sed -i ''  -e "s|<ZONE>|${ZONE}|g" $next
done


