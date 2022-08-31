# Terraform Starter

Helpful Terraform Links:
- [Terraform Language Documentation](https://www.terraform.io/docs/language/index.html)
- [Resource: aws_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)
- [Resource: aws_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)

## Step 0: Create a `dev-east.tfvars` file from the template
```
cp vars/template.tfvars vars/dev-east-1.tfvars
```

## Step 1: Initialize Terraform
```
terraform init
```

## Step 2: Plan Resources
```
terraform plan -var-file="vars/dev-east.tfvars"
```

## Step 3: Apply Resources
```
terraform apply -var-file="vars/dev-east.tfvars"
```

## Step 4: SSH to instance to get the admin password
```
chmod 400 <keypair>
ssh -i <keypair> ec2-user@<public_dns>
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
