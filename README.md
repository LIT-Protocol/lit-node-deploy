# How do I make it work ?
Do the following on a machine that is _different_ from the machine you are going to upgrade and has your ssh key on it (your normal dev PC works)
```
0. `apt-get` or `brew install` ansible

1. Set your machine details in `machine-description.yml`

2. run `bash upgrade.sh` or `ansible-playbook -v -i machine-description.yml manzano_upgrade.yml`
```