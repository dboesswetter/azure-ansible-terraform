FROM debian
RUN apt-get update && apt-get -y install curl unzip openssh-client
# install azure-cli (as seen here: https://docs.microsoft.com/de-de/cli/azure/install-azure-cli-apt)
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
# install ansible and the azure collection
RUN apt-get install -y python3-pip
RUN pip3 install ansible
RUN mkdir -p /usr/share/ansible/collections
RUN ansible-galaxy collection install azure.azcollection -p /usr/share/ansible/collections
RUN pip3 install -r /usr/share/ansible/collections/ansible_collections/azure/azcollection/requirements-azure.txt
# install teraform
RUN curl -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.13.3/terraform_0.13.3_linux_amd64.zip && unzip -d /usr/local/bin/ /tmp/terraform.zip
# create user
RUN useradd -m user
USER user
WORKDIR /home/user