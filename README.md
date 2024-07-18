# How do I make it work ?
```
0. `apt-get` or `brew install` ansible # wherever ansible is supported

1. Set your machine details in `machine-description.yml`

2. run `bash upgrade.sh` or `ansible-playbook -v -i machine-description.yml manzano_upgrade.yml`
```