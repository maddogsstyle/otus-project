#!/bin/bash
yc managed-kubernetes cluster create \
  --name otus-project \
  --network-name default \
  --zone ru-central1-b \
  --subnet-name default-ru-central1-b \
  --public-ip \
  --release-channel regular \
  --version 1.22 \
  --cluster-ipv4-range 10.1.0.0/16 \
  --service-ipv4-range 10.2.0.0/16 \
  --service-account-name maddogsstyle \
  --node-service-account-name maddogsstyle \
  --enable-network-policy \
  && \
  yc managed-kubernetes node-group create \
  --cluster-name otus-project \
  --location zone=ru-central1-b \
  --cores 6 \
  --core-fraction 100 \
  --disk-size 128 \
  --disk-type network-ssd \
  --fixed-size 1 \
  --memory 6 \
  --name node \
  --network-acceleration-type standard \
  --platform-id standard-v1 \
  --container-runtime docker \
  --version 1.22 \
  --metadata-from-file ssh-keys=./ssh.pub \
  --network-interface subnets=default-ru-central1-b,ipv4-address=nat \
  && \
  yc managed-kubernetes cluster get-credentials otus-project --external --force