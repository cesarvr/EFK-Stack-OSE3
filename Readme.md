## Logging Infrastructure for Microservices in OSE3/Kubernetes.


[end result](https://github.com/cesarvr/EFK-Stack-OSE3/blob/master/docs/demo.gif)


### Overview

 Application developers can view the logs of the projects for which they have view access. The EFK stack aggregates logs from hosts and applications, whether coming from multiple containers or even deleted pods.


 The EFK stack is a modified version of the ELK stack and is comprised of:

 - [Elasticsearch](https://www.elastic.co/products/elasticsearch): An object store where all logs are stored.

 - [Fluentd](http://www.fluentd.org/architecture): Gathers logs from nodes and feeds them to Elasticsearch.

 - [Kibana](https://www.elastic.co/guide/en/kibana/current/introduction.html): A web UI for Elasticsearch.


## Deployment

First create the user and assign the right permissions, to all the components of the stack.

```sh
# Remember to change the project names to reflect the yours.
  sh scripts/pre-deployment
```

Proceed to execute the script to install all the deployment, but before this make sure you install
the [origin-aggregated-logging](https://github.com/openshift/origin-aggregated-logging/tree/master/deployer).

```sh
$ oc apply -n openshift -f https://raw.githubusercontent.com/openshift/origin-aggregated-logging/master/deployer/deployer.yaml
```

Then execute the installation script

```sh
  sh scripts/install-aggregates-logging.sh
```


# Cleanup

You can remove everything generated during the deployment while leaving other project contents intact:


```sh
$ oc delete all --selector logging-infra=kibana
$ oc delete all --selector logging-infra=fluentd
$ oc delete all --selector logging-infra=elasticsearch
$ oc delete all --selector logging-infra=curator
$ oc delete all,sa,oauthclient --selector logging-infra=support
$ oc delete secret logging-fluentd logging-elasticsearch \
    logging-es-proxy logging-kibana logging-kibana-proxy \
    logging-kibana-ops-proxy

```

# Documentation

## Kibanna Documentation    

- [Setup](https://www.elastic.co/guide/en/kibana/current/setup.html)
- [Getting Started](https://www.elastic.co/guide/en/kibana/current/getting-started.html)
