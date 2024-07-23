# How do I make it work ?
Do the following on a machine that is _different_ from the machine you are going to upgrade and has your ssh key on it (your normal dev PC works)

1. `apt-get install ansible` or `brew install ansible`
2. Set your machine details in `machine-description.yml`
3. run `bash deploy.sh` or `ansible-playbook -v -i machine-description.yml deploy.yml`
4. If you did an initial deployment, **the user you use to SSH into the box may have changed** during the above step depending on what you have set in the install script during the guide's `B. Prepare for install` step. Change the `ansible_user` in `machine-description.yml` too in that case or the next step will fail.
5. ensure all is looking fine, and then finally run `bash reboot.sh`, wait up to 20 minutes for the machine to be accessible via ssh again

NOTE for `OVH ADVANCE` class devices:
    When doing an initial deployment with OLA (OVH Cloud Link Aggregation, see https://www.notion.so/litprotocol/Datil-test-Testnet-Node-Provisioning-Guide-6c78bd5e7ebd4b0f8cec1ad78e130be2?pvs=4#22de9bba0e7e49108509a5d60b8f6aaa), the IP you need to use to SSH into your box becomes the `host_ip` after reboot.
    After executing `reboot.sh` your machine may not be reachable (and the `reboot.sh` will time out waiting) until you change `ansible_host` to be equal to the `host_ip` (you can also just SSH into `host_ip` manually after reboot as that is the final step anyway)

If you encounter errors during this process:
1. save a copy of the `deploy.log` file and send it to someone from Lit Protocol for debugging
2. You may attempt to rerun the `deploy.sh` script, it will simply skip the already completed steps