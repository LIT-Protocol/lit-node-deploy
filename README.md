# Lit Node Deployment

This repository contains an Ansible playbook designed to simplify the deployment and upgrade process for `lit-node` on a single machine. It is intended to be used by Node Operators to provision their hardware according to Lit Protocol's requirements.

## Prerequisites

Before you begin, please ensure you have the following:

1.  **Ansible:** You must have Ansible installed on your local machine. You can install it using your system's package manager.
    *   **macOS:** `brew install ansible`
    *   **Ubuntu/Debian:** `sudo apt-get install ansible`
2.  **SSH Access:** You need SSH access to the target machine you intend to provision. This includes having an SSH key pair, and your public key should be authorized on the target machine.
3.  **Machine Details:** You should have all the required networking and configuration details for your node, as provided in the Lit Protocol Node Provisioning Guide.

## Configuration

The deployment is configured using a single file, `machine-description.yml`.

1.  **Create the Configuration File:**
    Start by copying the example file:
    ```bash
    cp machine-description.example.yml machine-description.yml
    ```

2.  **Edit `machine-description.yml`:**
    Open the `machine-description.yml` file and fill in all the required variables. Each variable is commented in the file to guide you. Pay close attention to the formatting and ensure all values are correctly entered.

### ZeroSSL API Key

A ZeroSSL API key is required to obtain the necessary SSL certificates for your node to communicate securely with the network.

1.  **Create an Account:** If you don't already have one, sign up for a free account on the [ZeroSSL website](https://zerossl.com/).
2.  **Generate an API Key:** Navigate to the **Developer** section of your ZeroSSL dashboard and generate a new API key.
3.  **Add the Key to Your Configuration:** Copy the generated API key and paste it as the value for the `zerossl_api_key` field in your `machine-description.yml` file.

## Deployment Steps

The deployment process is automated with a simple script.

1.  **Run the Deployment Script:**
    Execute the `deploy.sh` script from your terminal:
    ```bash
    bash deploy.sh
    ```
    This script will pull the latest changes from the repository and then run the Ansible playbook. The playbook will connect to your target machine via SSH and perform all the necessary steps to install and configure `lit-node`. This process can take an hour, so please be patient. A detailed log will be written to `deploy.log`.

    **Important:** After the initial deployment, the username you use to SSH into the machine may change to the value you set for `ansible_user` or `ssh_user` in `machine-description.yml`. Please make sure to use the new username for any subsequent connections.

2.  **Reboot the Machine:**
    After the deployment script completes successfully, you must reboot the machine to finalize the installation. Run the reboot script:
    ```bash
    bash reboot.sh
    ```
    It may take up to 20 minutes for the machine to become accessible via SSH again after rebooting.

## Special Considerations

### OVH Advance Devices

If you are using a bare-metal machine from OVH in the "Advance" product line and are configuring OLA (OVHCloud Link Aggregation), please be aware of the following:

*   For detailed instructions on configuring OLA, please refer to the [Datil Testnet Node Provisioning Guide](https://www.notion.so/litprotocol/Datil-test-Testnet-Node-Provisioning-Guide-6c78bd5e7ebd4b0f8cec1ad78e130be2?pvs=4#22de9bba0e7e49108509a5d60b8f6aaa).
*   After the final reboot, the IP address you use for SSH access will change to the value you set for `host_ip` in your `machine-description.yml`.
*   The `reboot.sh` script may time out, as it will lose connection. You can manually SSH into the machine using the new `host_ip` to confirm that the process is complete.

## Troubleshooting

If you encounter any errors during the deployment:

1.  **Save the Log:** Make a copy of the `deploy.log` file. This log contains detailed information that will be essential for debugging.
2.  **Contact Support:** Reach out to the Lit Protocol team and provide them with the `deploy.log` file.
3.  **Retry the Deployment:** In many cases, you can safely re-run the `deploy.sh` script. The playbook is designed to be idempotent, meaning it will skip any steps that have already been successfully completed.
