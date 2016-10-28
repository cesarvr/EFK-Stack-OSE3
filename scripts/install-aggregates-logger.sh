oc new-app logging-deployer-template \
    --param KIBANA_HOSTNAME=kibanaz.10.2.2.2.xip.io \
    --param ES_CLUSTER_SIZE=1 \
    --param PUBLIC_MASTER_URL=https://10.2.2.2:8443
