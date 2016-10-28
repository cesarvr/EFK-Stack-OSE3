oc delete all --selector logging-infra=kibana &&
oc delete all --selector logging-infra=fluentd &&
oc delete all --selector logging-infra=elasticsearch &&
oc delete all --selector logging-infra=curator &&
oc delete all,sa,oauthclient --selector logging-infra=support &&
oc delete secret logging-fluentd logging-elasticsearch \
    logging-es-proxy logging-kibana logging-kibana-proxy \
    logging-kibana-ops-proxy
