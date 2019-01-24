# Upload via sftp

key_file=~/.ssh/id_rsa.comps
sftp_opts="-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i ${key_file}"
declare -A "endpoints=(${ENDPOINTS_PACK})"

if [[ -f ${key_file} ]]; then
    echo "[ERROR] The private RSA key file already exists!"
    exit 1
fi
trap 'rm -f ${key_file}; ssh-agent -k' EXIT

touch ${key_file}
chmod 600 ${key_file}
curl -s "${SECRET_URL}" > ${key_file}

eval $(ssh-agent)

expect << EOF
  spawn ssh-add ${key_file}
  expect "Enter passphrase"
  send "${SECRET}\r"
  expect eof
EOF

unset SECRET SECRET_URL

sftp ${sftp_opts} -b - $(dirname ${endpoints[core_${NSVER}_updates]:?invalid ENDPOINT}) <<EOF
put nethforge-groups.xml nethforge-groups.xml
put nethserver-groups.xml updates-groups.xml
put arm-nethforge-groups.xml
put arm-nethserver-groups.xml
EOF