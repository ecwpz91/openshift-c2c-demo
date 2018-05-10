## Overview

## Prerequisites

-   Ansible 2.4.2 or later is required
-   You must update the `~/.ssh/config` file to include your keypair so the playbook can access the VMs in AWS. To do this, include the following line in you config file:

```sh
IdentityFile ~/.ssh/mykeypair.pem
```

Where `mykeypair` is the name of your keypair. Obviously you need to have a copy of mykeypair.pem in the .ssh directory as well in order for it to be used.

Also, you need to have read+write for user only permissions set on `~/.ssh/config`, like so:

```sh
chmod 600 ~/.ssh/config
```

Otherwise you'll encounter 'bad owner or permissions on ssh/config' error message.

## Ansible Compatibility

Note that some specific versions of Ansible will not work due to bugs, here is a list of the ones I am aware of:

-   2.4.1 - <https://github.com/ansible/ansible/issues/31905>
-   2.5.1 - <https://github.com/ansible/ansible/issues/39234>

## Run

```sh
./playbook-run.sh
```

<!-- OR

```sh
./playbook-run.sh -e openshift_management_public_route=xxxxx -e openshift_master_cluster_public_hostname=xxxxx -e openshift_master_api_port=xxxxx
``` -->

Note the above is just an example, please update all variables including the pool name which is correct for your situation.
