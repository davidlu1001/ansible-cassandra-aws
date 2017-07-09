# Ansible Apache Cassandra playbook [WIP]

This is an Ansible playbook for deploying Apache Cassandra 3.0

This playbook was tested on Ubuntu 16.04 x86_64.

# Finished

1. Create VPC related stuff with AWS CloudFormation [template](https://s3.amazonaws.com/quickstart-reference/aws/vpc/latest/templates/aws-vpc.template) by ansible

- Launch Cassandra cluster within a VPC to offer enhanced networking feature for higher performance (more packets per second), lower latency

- Ansible role for VPC: roles/vpc/tasks/main.yml

2. Create 3 nodes EC2: in Public Subnet, 1 node per different AZ

- Set up a cluster in Availability Zones us-wast-2a, us-wast-2b, and us-wast-2c and set a replication factor of 3 at the keyspace level, then each write operation will be replicated across nodes in these three Availability Zones.

- Ansible role for EC2: roles/ec2instance/tasks/main.yml

3. Deploy Cassandra Cluster locally using Ansible with Vagrant & Virtualbox

- Please find in GitHub: [ansible-cassandra-vagrant](https://github.com/davidlu1001/ansible-cassandra-vagrant)

## TODO

* Support deploy Cassandra Cluster into AWS
* Support deploy Cassandra Cluster in Private Subnet with Bastion in Public Subnet
* Support [Dynamic EC2 Inventory Management](https://aws.amazon.com/cn/blogs/apn/getting-started-with-ansible-and-dynamic-amazon-ec2-inventory-management/)
* Parameterize more cassandra.yaml options
* Allow user to specify JDK & JRE version (1.7 and 1.8) and Cassandra version (2.0 and 3.0)
* Support building custom AMIs (contains the stable JDK, required agents, Cassandra software packages and so on) can be used as a golden image
* Backup & Recovery
Consider using the Netflix-built and open-sourced tool [Priam](https://github.com/Netflix/Priam) for Cassandra backup and recovery.
* Auto Scaling group
Set up an Auto Scaling group with minimum, maximum, and desired size set to the same size. Doing this will allow Auto Scaling to bring up a new node in the place of a failed node when a node fails with bootstrap

## Requirements

This playbook requires Ansible 1.2 or higher.

## group_vars

Variables which can be configured are located in the `group_vars/all` file.

## Running playbook

```bash
ansible-playbook -i inventory/hosts playbooks/ec2creation/init.yml -vv
```
## Future Reference Architecture from DataStax

![DataStax Arch](https://d0.awsstatic.com/partner-network/QuickStart/datasheets/dse-on-aws-architecture.png)

## References

* [DataStax Enterprise on AWS](https://aws.amazon.com/cn/quickstart/architecture/datastax-enterprise/)
* [Whitepaper - Apache Cassandra on AWS](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0ahUKEwj46YTqhfzUAhXDF5QKHdIxD3UQFggyMAA&url=https%3A%2F%2Fd0.awsstatic.com%2Fwhitepapers%2FCassandra_on_AWS.pdf&usg=AFQjCNFMM63do3tApNvPWog6VUsKeiXeig)

## License

This playbook is distributed under the
[Apache 2.0 license](http://www.apache.org/licenses/LICENSE-2.0.html).
