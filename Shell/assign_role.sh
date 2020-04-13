# Get the resource ID of your AKS cluster
AKS_CLUSTER=$(az aks show --resource-group Ubidy.IT.Kubernetes.AustraliaEast.Production --name ubidy-kube-prod --query id -o tsv)

# Get the account credentials for the logged in user
ACCOUNT_UPN=maridin.sanmiguel@ubidy.com
ACCOUNT_ID=$(az ad user show --upn-or-object-id $ACCOUNT_UPN --query objectId -o tsv)

# Assign the 'Cluster User' role to the user
az role assignment create \
    --assignee $ACCOUNT_ID \
    --scope $AKS_CLUSTER \
    --role "Azure Kubernetes Service Cluster User Role"
