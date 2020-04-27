#cloud-config

output:
    init:
        output: "> /var/log/cloud-init.out"
        error: "> /var/log/cloud-init.err"
    config: "tee -a /var/log/cloud-config.log"
    final:
        - ">> /var/log/cloud-final.out"
        - "/var/log/cloud-final.err"

packages:
    -  wget
    -  curl

runcmd:
 - [ sh, -c, "Setting up AWS System Manager: echo $(hostname)" ]
#  - [ sh, -c, sudo systemctl enable amazon-ssm-agent ]
#  - [ sh, -c, sudo systemctl start amazon-ssm-agent ]
#  - [ sh, -c, sudo systemctl enable nginx ]
#  - [ sh, -c, sudo systemctl start nginx ]

 # Note: Don't write files to /tmp from cloud-init use /run/somedir instead.
 # Early boot environments can race systemd-tmpfiles-clean LP: #1707222.
