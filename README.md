# Vagrant Mesos

This is the `Mesos` box for `Vagrant` running on `VirtualBox`. This VM box has
been built to help prototype Mesos cluster on your local development machine.

## Requirements

* [Vagrant](https://www.vagrantup.com) (1.8.1)

##### For development build

* [Packer](https://www.packer.io) (0.10.0)
* [Ansible](https://www.ansible.com) (2.0.1)

## Usage

```
$ vagrant init activatedgeek/mesos
```
This will pull the latest box from [Atlas Box Directory](https://atlas.hashicorp.com/boxes/search)
if already not available on the host machine.

To learn more about Vagrant: [https://www.vagrantup.com/docs/](https://www.vagrantup.com/docs/).

## Build

To build from source,
```
$ packer build mesos.json
```

**NOTE**: The provisioner requires Ansible, ensure that it is available in
the `PATH`.

## Build via Atlas

To run your builds on the [Atlas Platform](https://atlas.hashicorp.com/vagrant),

* Create a new [Vagrant Box](https://atlas.hashicorp.com/boxes/new)

* Update the `artifact_name` and `artifact_version` user variables in the
JSON template file

* Generate a new token from [Atlas Console](https://atlas.hashicorp.com/settings/tokens)
and save it in the root of project as `ATLAS_TOKEN`

* Run `make mesos`

## Contribution

* Fork this repository

* Create your working branch and develop your feature

* Submit your pull request

* Watch out for issues [here](https://github.com/activatedgeek/vagrant-mesos/issues)
