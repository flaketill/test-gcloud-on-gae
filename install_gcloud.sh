#!/bin/bash

virtualenv gcloud
source gcloud/bin/activate
pip install gcloud
cp -r gcloud/lib/python2.7/site-packages/gcloud/ application/vendor/
cp -r gcloud/lib/python2.7/site-packages/six.py* application/vendor/
cp -r gcloud/lib/python2.7/site-packages/httplib2/ application/vendor/
cp -r gcloud/lib/python2.7/site-packages/oauth2client/ application/vendor/
rm -fr application/vendor/gcloud/storage/

wget https://pypi.python.org/packages/source/g/gaepytz/gaepytz-2011h.zip#md5=0f130ef491509775b5ed8c5f62bf66fb
unzip -oq gaepytz-2011h.zip
mv gaepytz-2011h/pytz application/vendor/
rm -fr gaepytz-2011h/
rm -f gaepytz-2011h.zip

deactivate
rm -fr gcloud/
git add application/vendor/