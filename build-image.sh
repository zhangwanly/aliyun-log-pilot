#!/usr/bin/env bash
docker build -t harbor.chengta-inc.com/infra/logging-collector:filebeat-7.6.2 -f Dockerfile.filebeat .
