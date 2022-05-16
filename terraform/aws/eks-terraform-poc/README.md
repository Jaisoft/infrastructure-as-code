# Learn Terraform - Provision an EKS Cluster

This repo is a companion repo to the [Provision an EKS Cluster learn guide](https://learn.hashicorp.com/terraform/kubernetes/provision-eks-cluster), containing
Terraform configuration files to provision an EKS cluster on AWS.


aws configure


terraform init 

terraform apply 

rm ~/.kube/config

aws eks update-kubeconfig --region region-code --name cluster-name

kubectl get svc



kubectl apply -f kubernetes-dashboard-admin.rbac.yaml

kubectl proxy