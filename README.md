# Ansible Apache Cassandra playbook

This is an Ansible playbook for deploying Apache Cassandra 2.0/3.0

This playbook was tested on Ubuntu 16.04 x86_64.

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

## TODO

* Support deploy Cassandra Cluster in Private Subnet with Bastion in Public Subnet
* Parameterize more cassandra.yaml options
* Allow user to specify JDK & JRE version (1.7 and 1.8)

## References

* [DataStax Enterprise on AWS](https://aws.amazon.com/cn/quickstart/architecture/datastax-enterprise/)
* [Whitepaper - Apache Cassandra on AWS](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0ahUKEwj46YTqhfzUAhXDF5QKHdIxD3UQFggyMAA&url=https%3A%2F%2Fd0.awsstatic.com%2Fwhitepapers%2FCassandra_on_AWS.pdf&usg=AFQjCNFMM63do3tApNvPWog6VUsKeiXeig)

## License

This playbook is distributed under the
[Apache 2.0 license](http://www.apache.org/licenses/LICENSE-2.0.html).
