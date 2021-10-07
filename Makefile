init:
	terraform init

plan:
	terraform plan

apply:
	terraform apply
	az account set --subscription 04d8fd78-df37-4d8f-abe4-b53c159a2fe5
	az aks get-credentials --resource-group aks_test_luis --name devOps-k8s

destroy:
	terraform destroy