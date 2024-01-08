packer build -force \
		-var-file="\\Mac\packer-examples-for-vsphere\config\homelab\vsphere.pkrvars.hcl" \
		-var-file="\\Mac\packer-examples-for-vsphere\config\homelab\build.pkrvars.hcl" \
		-var-file="\\Mac\packer-examples-for-vsphere\config\homelab\common.pkrvars.hcl" \
		"\\Mac\packer-examples-for-vsphere\builds\windows\desktop\11 Enterprise"