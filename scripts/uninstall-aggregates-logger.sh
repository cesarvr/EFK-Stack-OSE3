sh tmpl.sh &&
sh dc.sh && 
sh ro.sh &&
sh svc.sh &&
sh d.sh 
oc delete all --selector component=deployer
oc delete all --selector component=es
