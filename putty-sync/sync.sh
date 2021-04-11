#!/bin/bash
gsutil -m rsync -r "gs://${BUCKET_NAME}" site
rsync -auH "${PUTTY_URL}" ./site/
rsync -au ./html/ ./site/
gsutil -m rsync -r site "gs://${BUCKET_NAME}"
