#!/bin/bash

set -euo pipefail

# shellcheck disable=SC1091
source /lib.sh

lint() {
    find . -name 'Dockerfile' -type f -exec hadolint {} +
}

main() {
    if [[ "${GITHUB_EVENT_NAME}" == "push" ]]; then
        lint
    fi
}

main "${@}"
