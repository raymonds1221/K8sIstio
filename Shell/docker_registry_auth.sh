e# first
echo "https://jenkins-x.io/commands/jx_create_docker/"

# from config.json
kubectl create secret generic jenkins-docker-cfg --from-file./config.json

# Global
jx create docker auth \
--host "ubidy.azurecr.io" \
--user "ubidy" \
--email "admin@ubidy.com" \
--secret "yourACRSecret"

# Per namespace
kubectl create secret docker-registry jenkins-docker-cfg \
--docker-server="ubidy.azurecr.io" \
--docker-username="ubidy" \
--docker-password="yourACRSecret" \
--docker-email="admin@ubidy.com" \
--namespace=jx-XXXX-pr-X
