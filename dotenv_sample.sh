#!/bin/bash

set -eu

ENV="development"

# ===============================

DEV_ENV="conf/.env.development"
PROD_ENV="conf/.env.production"


function load_env() {
    # set env_file based on ENV
    local env_file
    case ${ENV} in
        "dev"|"develop"|"development")
            env_file=${DEV_ENV};;
        "prd"|"prod"|"production")
            env_file=${PROD_ENV};;
        *)
            exit 1
    esac

    # read env_file
    eval $(cat ${env_file} | grep -v '^#' | grep -v '^\s*$' | sed 's/ *= */=/')
}

# load environment variable
load_env

# confirmation
[ -n "${ENV1:-}" ] && echo "${ENV1}"
[ -n "${ENV2:-}" ] && echo "${ENV2}"
[ -n "${ENV3:-}" ] && echo "${ENV3}"

exit

