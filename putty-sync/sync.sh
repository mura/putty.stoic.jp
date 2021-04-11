#!/bin/bash
PUTTY_URL='rsync://rsync.chiark.greenend.org.uk/ftp/users/sgtatham/putty-website-mirror/'
rsync -auH "${PUTTY_URL}" ./site/
rsync -auH ./html/ ./site/
gsutil -m rsync -r site "gs://${BUCKET_NAME}"
