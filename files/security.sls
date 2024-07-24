firewall:
  allowed_ports:
    22:
      protocol: tcp
      source:
        - 0.0.0.0/0

sshd_allow_passwords: False
sshd_bind_localhost: False
