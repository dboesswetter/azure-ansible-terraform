# azure-ansible-terraform

Dockerfile to create a Debian image with terraform and Ansible installed and configured to work with Azure

```
docker run -ti -e ARM_CLIENT_ID=... -e ARM_SUBSCRIPTION_ID=... -e ARM_TENANT_ID=... -e ARM_CLIENT_SECRET=... -v ~/work:/home/user/work -v ~/.ssh:/home/user/.ssh azure-ansible-terraform:2
```

Note that the environment variables used in the command above are those understood by the terraform Azure provisioner. Ansible
expects slightly different variable names:

```
> export AZURE_CLIENT_ID=$ARM_CLIENT_ID
> export AZURE_SECRET=$ARM_CLIENT_SECRET
> export AZURE_SUBSCRIPTION_ID=$ARM_SUBSCRIPTION_ID
> export AZURE_TENANT=$ARM_TENANT_ID
> ansible-playbook ...
```
