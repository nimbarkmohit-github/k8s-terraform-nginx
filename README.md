# Terraform-K8S-Nginx

@maintaner : Mohit Nimbark nimbarkmohit@gmail.com
---------------------------------------------------

This tutorial is for deploy nginx containers in kubernetes and expose using the kubernetes services using terraform 

1. clone the github code and change the directory to your project directory
>> git clone https://github.com/nimbarkmohit-github/k8s-terraform-nginx.git

2. Initialize the terraform and setup the terraform provider, also need to apply terraform providers (kubernetes) on prem configuration changes then run the below command. 
>> terraform init

3. terraform plan
4. terraform apply

you can destroy your kubernetes namespace, deployment, pods and services using the below terraform command.

5. terraform destroy


-----------------------------------------------------------------------------------------------
reference URLs : 
https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/guides/getting-started
https://learn.hashicorp.com/tutorials/terraform/kubernetes-provider?in=terraform/kubernetes&utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS&_ga=2.178308068.1125106145.1626178375-800628955.1626178375
https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/guides/getting-started#provider-setup
