#!/bin/bash
PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR=/storage/plex
source /etc/sysconfig/plex
mkdir -p "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}"
chown -R docker:docker "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}"
