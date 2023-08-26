# 0x0B. SSH
This directory contains files created in response to set forth in ALX Africa student project "0x0B. SSH". These scripts demonstrate an introduction to RSA key generation and client configurations.

## Technologies
* Scripts written in Bash 5.0.17(1)
* Tested on Ubuntu 20.04.6 LTS
* Puppet 5.5.10

## Files
| Filename | Description |
|--------|-----------|
| `0-use_a_private_key` | Uses `ssh` to connect to your server using the private key ~/.ssh/school with the user ubuntu. |
| `1-create_ssh_key_pair` | Creates an RSA key pair. |
| `2-ssh_config` | SSH client configuration using a private key and refusing to authenticate using a password. |
| `100-puppet_ssh_config.pp` | Sets up the client SSH configuration file to connect to a server without typing a password. |
