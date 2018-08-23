
# Searchlight

This is an experimental build to be tried with Platform9 setup of OpenStack.

The build relies on use of Docker to run both searchlight and elastic.
There are hardcoded passwords and hardcoded name of the 'DU' in the script.
But it does work for experimental purposes.

## How to

There are major components of the setup
* docker-images: My build script publish rparikh/searchlight on dockerhub
* setup-script: Download setup-searchlight and change "DU_FQDN" with the appropriate DU name and RUN it on the DU

```bash
curl -s https://raw.githubusercontent.com/platform9-incubator/searchlight/rparikh/pike/setup-searchlight > setup-searchlight
sed -i .bak 's/pf9-rp-jaegertest.platform9.horse/<YOUR DU FQDN>/g' setup-searchlight
setup-searchlight
```

The setup-searchlight will perform the following actions:
* Run elasticsearch as a docker container
* Create user, endpoints for searchlight in keystone
* Run searchlight as a docker container
* Add /searchlight path in nginx (you can access searchlight index via DU_FQDN/searchlight endpoint)
* Create indexes (one time): TODO: How to do it on a continous basis


# Upstream info: Team and repository tags

![Build Status](https://governance.openstack.org/badges/searchlight.svg)
![Official Status](https://governance.openstack.org/reference/tags/index.html)
    
## Searchlight

The Searchlight project provides indexing and search capabilities across
OpenStack resources. Its goal is to achieve high performance and flexible
querying combined with near real-time indexing.

Use the following resources to learn more:

* `Official Searchlight documentation <https://docs.openstack.org/searchlight/latest>`_
