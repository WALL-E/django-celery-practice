from __future__ import absolute_import

from celery import shared_task

import requests


@shared_task
def http_get(url):
    kwargs = {}
    kwargs["verify"] = False
    kwargs["headers"] = {"uni-source": "RestHub/cuckoo"}
    response = requests.get(url, **kwargs)
    return response.status_code, response.text
