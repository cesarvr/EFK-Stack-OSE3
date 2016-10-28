
# enable the logging-deployer service account to create the objects needed for a logging deployment
oc policy add-role-to-user edit --serviceaccount logging-deployer &

# Enable the Fluentd service account, which the deployer will create,
# that requires special privileges to operate Fluentd.
# Add the service account user to the security context.

oadm policy add-scc-to-user  \
    privileged system:serviceaccount:logging:aggregated-logging-fluentd &


# Give the Fluentd service account permission to read labels from all pods
# template location: https://github.com/openshift/origin-aggregated-logging
oadm policy add-cluster-role-to-user cluster-reader \
    system:serviceaccount:logging:aggregated-logging-fluentd
