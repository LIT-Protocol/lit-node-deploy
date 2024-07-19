# How do I make it work ?
Do the following on a machine that is _different_ from the machine you are going to upgrade and has your ssh key on it (your normal dev PC works)
```
0. `apt-get` or `brew install` ansible

1. Set your machine details in `machine-description.yml`

2. run `bash deploy.sh` or `ansible-playbook -v -i machine-description.yml deploy.yml`

3. If you did an initial deployment, the user you use to SSH into the box may have changed during the above step depending on what you have set in `users.sls`. Change the `ansible_user` in `machine-description.yml` too in that case or the next step will fail.

4. ensure all is looking fine, and then finally run `bash reboot.sh`, wait up to 20 minutes for the machine to be accessible via ssh again
```