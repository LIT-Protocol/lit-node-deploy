# How do I make it work ?
```
apt-get/brew install ansible # wherever ansible is supported

# Now set your machine details in `machine-description.yml`, then run

ansible-playbook -v -i machine-description.yml manzano_upgrade.yml
```