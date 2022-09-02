# Terraform Starter

Helpful Terraform Links:
- [Terraform Language Documentation](https://www.terraform.io/docs/language/index.html)
- [Resource: aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)
- [Resource: aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)

## Step 0: Create a `dev-west-2.tfvars` file from the template
```
cp vars/template.tfvars vars/dev-west-2.tfvars
```

## Step 1: Initialize Terraform
```
terraform init
```

## Step 2: Plan Resources
```
terraform plan -var-file="vars/dev-west-2.tfvars"
```

## Step 3: Apply Resources
```
terraform apply -var-file="vars/dev-west-2.tfvars"
```

## Step 4: SSH to instance to get the admin password
```
chmod 400 <keypair>
ssh -i <keypair> ec2-user@<public_dns>
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

Some useful commands:
cat /home/ec2-user/.kube/config  #to get context information of kubernetes cluster
kubectl create namespace test #to create namespace in kubernetes cluster
kubectl get deployments --namespace=test #to get deployments in a namespace in kubernetes cluster
kubectl get svc --namespace=test #to get services in a namespace in kubernetes cluster
kubectl delete all --all -n test #to delete everything in a namespace in kubernetes cluster
docker system prune  # to delete unused docker images to cleanup memeory on system 
docker image rm imagename  # to delete a docker image
```
