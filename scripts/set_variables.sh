#!/bin/bash

cat > /ansible/host_vars/$IIS_SERVER.yml <<EOF
ansible_host: "{{ lookup('env','IIS_SERVER') }}"
ansible_winrm_scheme: http
ansible_port: 5985
ansible_connection: winrm
ansible_user: "{{ lookup('env','ANSIBLE_USER') }}"
ansible_password: "{{ lookup('env','ANSIBLE_PASS') }}"
ansible_winrm_transport: ntlm
EOF

echo $IIS_SERVER >> /ansible/hosts

export SRC_APP_PATH="$SRC_PATH\\$CI_PROJECT_NAME"
export PWD_FILES="$PWD/"
