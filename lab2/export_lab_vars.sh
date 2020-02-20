#!/bin/bash

SCRIPT_CMD="$0"

GCP_PROJECT=
NAMESPACE=

function print_usage() {
  CMD="$1"
  ERROR_MSG="$2"

  if [ "$ERROR_MSG" != "" ]; then
    echo -e "\nERROR: $ERROR_MSG"
  fi

  echo -e "\nUse this script to update env vars used in lab commands"
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
            GCP_PROJECT="$2"
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

if [ "$GCP_PROJECT" == "" ]; then
  print_usage "$SCRIPT_CMD" "Please provide the GCP project name using: -p <project>"
  exit 1
fi

export LW_K8S_GCP_PROJECT="${GCP_PROJECT}"
export LW_K8S_CLUSTER="${GCP_PROJECT}-trng"
export LW_K8S_NAMESPACE="${NAMESPACE}"
export LW_K8S_ZONE="us-west1"
export LW_K8S_RELEASE="${NAMESPACE}"

echo -e "\nExported the following settings to your shell env:\n"
echo "LW_K8S_GCP_PROJECT = $LW_K8S_GCP_PROJECT"
echo "LW_K8S_CLUSTER = $LW_K8S_CLUSTER"
echo "LW_K8S_NAMESPACE = $LW_K8S_NAMESPACE"
echo "LW_K8S_ZONE = $LW_K8S_ZONE"
echo "LW_K8S_RELEASE = $LW_K8S_RELEASE"
echo -e "\nYou can now copy-and-paste commands from the labs into this shell."



