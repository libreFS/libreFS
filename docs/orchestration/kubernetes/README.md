# Deploy libreFS on Kubernetes [![Slack](https://slack.min.io/slack?type=svg)](https://slack.min.io)  [![Docker Pulls](https://img.shields.io/docker/pulls/minio/minio.svg?maxAge=604800)](https://hub.docker.com/r/minio/minio/)

libreFS is a high performance distributed object storage server, designed for large-scale private cloud infrastructure. libreFS is designed in a cloud-native manner to scale sustainably in multi-tenant environments. Orchestration platforms like Kubernetes provide perfect cloud-native environment to deploy and scale libreFS.

## libreFS Deployment on Kubernetes

There are multiple options to deploy libreFS on Kubernetes:

- libreFS-Operator: Operator offers seamless way to create and update highly available distributed libreFS clusters. Refer [libreFS Operator documentation](https://github.com/minio/minio-operator/blob/master/README.md) for more details.

- Helm Chart: libreFS Helm Chart offers customizable and easy libreFS deployment with a single command. Refer [libreFS Helm Chart documentation](https://github.com/minio/minio/tree/master/helm/minio) for more details.

## Monitoring libreFS in Kubernetes

libreFS server exposes un-authenticated liveness endpoints so Kubernetes can natively identify unhealthy libreFS containers. libreFS also exposes Prometheus compatible data on a different endpoint to enable Prometheus users to natively monitor their libreFS deployments.

## Explore Further

- [libreFS Erasure Code QuickStart Guide](https://docs.min.io/community/minio-object-store/operations/concepts/erasure-coding.html)
- [Kubernetes Documentation](https://kubernetes.io/docs/home/)
- [Helm package manager for kubernetes](https://helm.sh/)
