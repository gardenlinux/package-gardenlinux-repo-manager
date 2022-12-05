#!/usr/bin/env bash
set -Eeuo pipefail

# Obtain version from changelog file
GL_REPO_MGR_VER=$(awk 'NR==1{print $2}' debian/changelog | sed 's/[()]//g' | sed 's/.//6g')
# Patch version accroding to the changelog
sed -i "s/@@VER@@/$GL_REPO_MGR_VER/" garden-repo-manager
