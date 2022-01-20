#!/usr/bin/env bash

set -e

##substVars() {
##  sed -e "s;@DDEV_PROJECT@;${DDEV_PROJECT};g"
##}

if [ -z "${DDEV_PROJECT}" ]; then
  echo "error: not in ddev environment" >&2;
  echo "usage:";
  echo ""
  echo "    ddev exec .ddev/patch-contentia-db.sh";
  exit 1;
fi

if [ ! -z "${DDEV_ROUTER_HTTPS_PORT}" ] && [ "${DDEV_ROUTER_HTTPS_PORT}" != "443" ]; then
  HTTPS_PORT=':'"${DDEV_ROUTER_HTTPS_PORT}";
else
  HTTPS_PORT='';
fi

mysql <<!
UPDATE account SET accountPath = '${DDEV_PROJECT}.ddev.site${HTTPS_PORT}/', accountDomain = '${DDEV_PROJECT}.ddev.site${HTTPS_PORT}' WHERE accountId = 1;
UPDATE account SET accountPath = 'cms.${DDEV_PROJECT}.ddev.site${HTTPS_PORT}/', accountDomain = 'cms.${DDEV_PROJECT}.ddev.site${HTTPS_PORT},${DDEV_PROJECT}.ddev.site${HTTPS_PORT}/cms' WHERE accountId = 50;
!
