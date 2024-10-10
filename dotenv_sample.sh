#!/bin/bash
set -eu

env="development"

# ===============================

function load_env() {
    # set env_file based on ENV
    local env_file
    case "${1}" in
        "dev"|"develop"|"development")
            env_file="conf/.env.development";;
        "prd"|"prod"|"production")
            env_file="conf/.env.production";;
        *)
            exit 1
    esac

    # load env_file
    eval $(cat ${env_file} | grep -v '^#' | grep -v '^\s*$' | sed 's/ *= */=/')
}

# ===============================

# load environment variable
load_env ${env}

# confirmation
[ -n "${ENV1:-}" ] && echo "${ENV1}"
[ -n "${ENV2:-}" ] && echo "${ENV2}"
[ -n "${ENV3:-}" ] && echo "${ENV3}"

exit

