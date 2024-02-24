# isntalling falco
curl -fsSL https://falco.org/repo/falcosecurity-packages.asc | \
gpg --dearmor -o /usr/share/keyrings/falco-archive-keyring.gpg
bash -c 'cat << EOF > /etc/apt/sources.list.d/falcosecurity.list
deb [signed-by=/usr/share/keyrings/falco-archive-keyring.gpg] https://download.falco.org/packages/deb stable main
EOF'
apt-get update -y
apt-get install -y dkms make linux-headers-$(uname -r) dialog
apt-get install -y falco