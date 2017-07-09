# Ansible Apache Cassandra playbook [WIP]

This is an Ansible playbook for deploying Apache Cassandra 3.0

This playbook was tested on Ubuntu 16.04 x86_64.

# Finished

* 1. Create VPC related stuff with AWS CloudFormation [template](https://s3.amazonaws.com/quickstart-reference/aws/vpc/latest/templates/aws-vpc.template) by ansible

- Launch Cassandra cluster within a VPC to offer enhanced networking feature for higher performance (more packets per second), lower latency

- Ansible role for VPC: roles/vpc/tasks/main.yml

* 2. Create 3 nodes EC2: 1 node per different AZ

- Set up a cluster in Availability Zones us-wast-2a, us-wast-2b, and us-wast-2c and set a replication factor of 3 at the keyspace level, then each write operation will be replicated across nodes in these three Availability Zones.

- Ansible role for EC2: roles/ec2instance/tasks/main.yml

## TODO

* Support deploy Cassandra Cluster into AWS
  - Currently only deploy locally using Ansible with Vagrant & Virtualbox, please find in GitHub: [ansible-cassandra-vagrant](https://github.com/davidlu1001/ansible-cassandra-vagrant)
* Support deploy Cassandra Cluster in Private Subnet with Bastion in Public Subnet
* Parameterize more cassandra.yaml options
* Allow user to specify JDK & JRE version (1.7 and 1.8) and Cassandra version (2.0 and 3.0)

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
