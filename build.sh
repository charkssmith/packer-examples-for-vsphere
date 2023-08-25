#!/usr/bin/env bash

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
# WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
# OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

set -e

follow_link() {
	FILE="$1"
	while [ -h "$FILE" ]; do
		# On Mac OS, readlink -f doesn't work.
		FILE="$(readlink "$FILE")"
	done
	echo "$FILE"
}

SCRIPT_PATH=$(realpath "$(dirname "$(follow_link "$0")")")
CONFIG_PATH=$(realpath "${1:-${SCRIPT_PATH}/config}")

menu_option_1() {
	INPUT_PATH="$SCRIPT_PATH"/builds/linux/photon/4/
	echo -e "\nCONFIRM: Build a VMware Photon OS 4 Template for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a VMware Photon OS 4 Template for VMware vSphere. ###
	echo "Building a VMware Photon OS 4 Template for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/proxy.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_2() {
	INPUT_PATH="$SCRIPT_PATH"/builds/linux/photon/5/
	echo -e "\nCONFIRM: Build a VMware Photon OS 5 Template for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a VMware Photon OS 4 Template for VMware vSphere. ###
	echo "Building a VMware Photon OS 5 Template for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/proxy.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_3() {
	INPUT_PATH="$SCRIPT_PATH"/builds/linux/debian/11/
	echo -e "\nCONFIRM: Build a Debian 11 Template for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a Debian 11 Template for VMware vSphere. ###
	echo "Building a Debian 11 Template for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/proxy.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_4() {
	INPUT_PATH="$SCRIPT_PATH"/builds/linux/ubuntu/22-04-lts/
	echo -e "\nCONFIRM: Build a Ubuntu Server 22.04 LTS (cloud-init) Template for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a Ubuntu Server 22.04 LTS (cloud-init) Template for VMware vSphere. ###
	echo "Building a Ubuntu Server 22.04 LTS (cloud-init) Template for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/proxy.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_5() {
	INPUT_PATH="$SCRIPT_PATH"/builds/linux/ubuntu/20-04-lts/
	echo -e "\nCONFIRM: Build a Ubuntu Server 20.04 LTS (cloud-init) Template for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a Ubuntu Server 20.04 LTS (cloud-init) Template for VMware vSphere. ###
	echo "Building a Ubuntu Server 20.04 LTS (cloud-init) Template for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/proxy.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_6() {
	INPUT_PATH="$SCRIPT_PATH"/builds/linux/ubuntu/18-04-lts/
	echo -e "\nCONFIRM: Build a Ubuntu Server 18.04 LTS Template for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a Ubuntu Server 18.04 LTS Template for VMware vSphere. ###
	echo "Building a Ubuntu Server 18.04 LTS Template for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/proxy.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_7() {
	INPUT_PATH="$SCRIPT_PATH"/builds/linux/rhel/9/
	echo -e "\nCONFIRM: Build a Red Hat Enterprise Linux 9 Template for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a Red Hat Enterprise Linux 9 Template for VMware vSphere. ###
	echo "Building a Red Hat Enterprise Linux 9 Template for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/proxy.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/rhsm.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_8() {
	INPUT_PATH="$SCRIPT_PATH"/builds/linux/rhel/8/
	echo -e "\nCONFIRM: Build a Red Hat Enterprise Linux 8 Template for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a Red Hat Enterprise Linux 8 Template for VMware vSphere. ###
	echo "Building a Red Hat Enterprise Linux 8 Template for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/proxy.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/rhsm.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_9() {
	INPUT_PATH="$SCRIPT_PATH"/builds/linux/rhel/7/
	echo -e "\nCONFIRM: Build a Red Hat Enterprise Linux 7 Template for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a Red Hat Enterprise Linux 7 Template for VMware vSphere. ###
	echo "Building a Red Hat Enterprise Linux 7 Template for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/proxy.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/rhsm.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_10() {
	INPUT_PATH="$SCRIPT_PATH"/builds/linux/almalinux/9/
	echo -e "\nCONFIRM: Build a AlmaLinux OS 9 Template for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a AlmaLinux OS 9 Template for VMware vSphere. ###
	echo "Building a AlmaLinux OS 9 Template for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/proxy.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_11() {
	INPUT_PATH="$SCRIPT_PATH"/builds/linux/almalinux/8/
	echo -e "\nCONFIRM: Build a AlmaLinux OS 8 Template for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a AlmaLinux OS 8 Template for VMware vSphere. ###
	echo "Building a AlmaLinux OS 8 Template for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/proxy.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_12() {
	INPUT_PATH="$SCRIPT_PATH"/builds/linux/rocky/9/
	echo -e "\nCONFIRM: Build a Rocky Linux 9 Template for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a Rocky Linux 9 Template for VMware vSphere. ###
	echo "Building a Rocky Linux 9 Template for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/proxy.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_13() {
	INPUT_PATH="$SCRIPT_PATH"/builds/linux/rocky/8/
	echo -e "\nCONFIRM: Build a Rocky Linux 8 Template for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a Rocky Linux 8 Template for VMware vSphere. ###
	echo "Building a Rocky Linux 8 Template for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/proxy.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_14() {
	INPUT_PATH="$SCRIPT_PATH"/builds/linux/centos/9-stream/
	echo -e "\nCONFIRM: Build a CentOS Stream 9 Template for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a CentOS Stream 9 Template for VMware vSphere. ###
	echo "Building a CentOS Stream 9 Template for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/proxy.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_15() {
	INPUT_PATH="$SCRIPT_PATH"/builds/linux/centos/8-stream/
	echo -e "\nCONFIRM: Build a CentOS Stream 8 Template for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a CentOS Stream 8 Template for VMware vSphere. ###
	echo "Building a CentOS Stream 8 Template for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/proxy.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_16() {
	INPUT_PATH="$SCRIPT_PATH"/builds/linux/centos/7/
	echo -e "\nCONFIRM: Build a CentOS Linux 7 Template for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a CentOS Linux 7 Template for VMware vSphere. ###
	echo "Building a CentOS Linux 7 Template for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/proxy.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_17() {
	INPUT_PATH="$SCRIPT_PATH"/builds/linux/sles/15/
	echo -e "\nCONFIRM: Build a SUSE Linux Enterprise Server 15 Template for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a SUSE Linux Enterprise Server 15 Template for VMware vSphere. ###
	echo "Building a SUSE Linux Enterprise Server 15 Template for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/proxy.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/scc.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_30() {
	INPUT_PATH="$SCRIPT_PATH"/builds/windows/server/2022/
	echo -e "\nCONFIRM: Build all Windows Server 2022 Templates for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build all Windows Server 2022 Templates for VMware vSphere. ###
	echo "Building all Windows Server 2022 Templates for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_31() {
	INPUT_PATH="$SCRIPT_PATH"/builds/windows/server/2022/
	echo -e "\nCONFIRM: Build Microsoft Windows Server 2022 Standard Templates for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build Microsoft Windows Server 2022 Standard Templates for VMware vSphere. ###
	echo "Building Microsoft Windows Server 2022 Standard Templates for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		--only vsphere-iso.windows-server-standard-dexp,vsphere-iso.windows-server-standard-core \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_32() {
	INPUT_PATH="$SCRIPT_PATH"/builds/windows/server/2022/
	echo -e "\nCONFIRM: Build Microsoft Windows Server 2022 Datacenter Templates for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build Microsoft Windows Server 2022 Datacenter Templates for VMware vSphere. ###
	echo "Building Microsoft Windows Server 2022 Datacenter Templates for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		--only vsphere-iso.windows-server-datacenter-dexp,vsphere-iso.windows-server-datacenter-core \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_33() {
	INPUT_PATH="$SCRIPT_PATH"/builds/windows/server/2019/
	echo -e "\nCONFIRM: Build all Windows Server 2019 Templates for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build all Windows Server 2019 Templates for VMware vSphere. ###
	echo "Building all Windows Server 2019 Templates for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_34() {
	INPUT_PATH="$SCRIPT_PATH"/builds/windows/server/2019/
	echo -e "\nCONFIRM: Build Microsoft Windows Server 2019 Standard Templates for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build Microsoft Windows Server 2019 Standard Templates for VMware vSphere. ###
	echo "Building Microsoft Windows Server 2019 Standard Templates for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		--only vsphere-iso.windows-server-standard-dexp,vsphere-iso.windows-server-standard-core \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_35() {
	INPUT_PATH="$SCRIPT_PATH"/builds/windows/server/2019/
	echo -e "\nCONFIRM: Build Microsoft Windows Server 2019 Datacenter Templates for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build Microsoft Windows Server 2019 Datacenter Templates for VMware vSphere. ###
	echo "Building Microsoft Windows Server 2019 Datacenter Templates for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		--only vsphere-iso.windows-server-datacenter-dexp,vsphere-iso.windows-server-datacenter-core \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_36() {
	INPUT_PATH="$SCRIPT_PATH"/builds/windows/desktop/11/
	echo -e "\nCONFIRM: Build a Windows 11 Template for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a Windows 11 Template for VMware vSphere. ###
	echo "Building a Windows 11 Template for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_37() {
	INPUT_PATH="$SCRIPT_PATH"/builds/windows/desktop/10/
	echo -e "\nCONFIRM: Build a Windows 10 Template for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a Windows 10 Template for VMware vSphere. ###
	echo "Building a Windows 10 Template for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}


menu_option_50() {
	INPUT_PATH="$SCRIPT_PATH""/builds/windows/desktop/11 Horizon Enterprise/"
	echo -e "\nCONFIRM: Build a Windows 11 Template for VMware vSphere to be used by Horizon?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a Windows 10 Template for VMware vSphere to be used by Horizon. ###
	echo "Building a Windows 11 Template for VMware vSphere to be used by Horizon..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_51() {
	INPUT_PATH="$SCRIPT_PATH""/builds/windows/desktop/11 Horizon Pro/"
	echo -e "\nCONFIRM: Build a Windows 11 Template for VMware vSphere to be used by Horizon?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a Windows 10 Template for VMware vSphere to be used by Horizon. ###
	echo "Building a Windows 11 Template for VMware vSphere to be used by Horizon..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_52() {
	INPUT_PATH="$SCRIPT_PATH""/builds/windows/desktop/11 Horizon Enterprise Profiler/"
	echo -e "\nCONFIRM: Build a Windows 11 Template for VMware vSphere to be used by Horizon?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a Windows 10 Template for VMware vSphere to be used by Horizon. ###
	echo "Building a Windows 11 Template for VMware vSphere to be used by Horizon to Profile and App Volumes..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_53() {
	INPUT_PATH="$SCRIPT_PATH""/builds/windows/desktop/11 Horizon Pro Profiler/"
	echo -e "\nCONFIRM: Build a Windows 11 Template for VMware vSphere to be used by Horizon?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a Windows 10 Template for VMware vSphere to be used by Horizon. ###
	echo "Building a Windows 11 Template for VMware vSphere to be used by Horizon to Profile and App Volumes..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_54() {
	INPUT_PATH="$SCRIPT_PATH""/builds/windows/desktop/10 Horizon Enterprise/"
	echo -e "\nCONFIRM: Build a Windows 10 Template for VMware vSphere to be used by Horizon?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a Windows 10 Template for VMware vSphere to be used by Horizon. ###
	echo "Building a Windows 10 Template for VMware vSphere to be used by Horizon..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_55() {
	INPUT_PATH="$SCRIPT_PATH""/builds/windows/desktop/10 Horizon Pro/"
	echo -e "\nCONFIRM: Build a Windows 10 Template for VMware vSphere to be used by Horizon?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a Windows 10 Template for VMware vSphere to be used by Horizon. ###
	echo "Building a Windows 10 Template for VMware vSphere to be used by Horizon..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_56() {
	INPUT_PATH="$SCRIPT_PATH""/builds/windows/desktop/10 Horizon Enterprise Profiler/"
	echo -e "\nCONFIRM: Build a Windows 10 Template for VMware vSphere to be used by Horizon?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a Windows 10 Template for VMware vSphere to be used by Horizon. ###
	echo "Building a Windows 10 Template for VMware vSphere to be used by Horizon to Profile and App Volumes..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_57() {
	INPUT_PATH="$SCRIPT_PATH""/builds/windows/desktop/10 Horizon Pro Profiler/"
	echo -e "\nCONFIRM: Build a Windows 10 Template for VMware vSphere to be used by Horizon?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a Windows 10 Template for VMware vSphere to be used by Horizon. ###
	echo "Building a Windows 10 Template for VMware vSphere to be used by Horizon to Profile and App Volumes..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}

menu_option_80() {
	INPUT_PATH="$SCRIPT_PATH"/builds/linux/photon/5/
	echo -e "\nCONFIRM: Build a VMware Photon OS 5 Packer for VMware vSphere?"
	echo -e "\nContinue? (y/n)"
	read -r REPLY
	if [[ ! $REPLY =~ ^[Yy]$ ]]; then
		exit 1
	fi

	### Build a VMware Photon OS 4 Template for VMware vSphere. ###
	echo "Building a VMware Photon OS 5 Template for VMware vSphere..."

	### Initialize HashiCorp Packer and required plugins. ###
	echo "Initializing HashiCorp Packer and required plugins..."
	packer init "$INPUT_PATH"

	### Start the Build. ###
	echo "Starting the build...."
	packer build -force \
		-var-file="$CONFIG_PATH/vsphere.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/build.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/ansible.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/proxy.pkrvars.hcl" \
		-var-file="$CONFIG_PATH/common.pkrvars.hcl" \
		"$INPUT_PATH"

	### All done. ###
	echo "Done."
}


press_enter() {
	cd "$SCRIPT_PATH"
	echo -n "Press Enter to continue."
	read -r
	clear
}

info() {
	echo "License: BSD-2"
	echo ""
	echo "For more information, review the project README."
	echo "GitHub Repository: github.com/vmware-samples/packer-examples-for-vsphere/"
	read -r
}

incorrect_selection() {
	echo "Do or do not. There is no try."
}

until [ "$selection" = "0" ]; do
	clear
	echo ""
	echo "    ____             __                ____        _ __    __     "
	echo "   / __ \____ ______/ /_____  _____   / __ )__  __(_) /___/ /____ "
	echo "  / /_/ / __  / ___/ //_/ _ \/ ___/  / __  / / / / / / __  / ___/ "
	echo " / ____/ /_/ / /__/ ,< /  __/ /     / /_/ / /_/ / / / /_/ (__  )  "
	echo "/_/    \__,_/\___/_/|_|\___/_/     /_____/\__,_/_/_/\__,_/____/   "
	echo ""
	echo -n "  Select a HashiCorp Packer build for VMware vSphere:"
	echo ""
	echo ""
	echo "      Linux Distribution:"
	echo ""
	echo "    	 1  -  VMware Photon OS 4"
	echo "    	 2  -  VMware Photon OS 5"
	echo "    	 3  -  Debian 11"
	echo "    	 4  -  Ubuntu Server 22.04 LTS (cloud-init)"
	echo "    	 5  -  Ubuntu Server 20.04 LTS (cloud-init)"
	echo "    	 6  -  Ubuntu Server 18.04 LTS"
	echo "    	 7  -  Red Hat Enterprise Linux 9"
	echo "    	 8  -  Red Hat Enterprise Linux 8"
	echo "    	 9  -  Red Hat Enterprise Linux 7"
	echo "    	10  -  AlmaLinux OS 9"
	echo "    	11  -  AlmaLinux OS 8"
	echo "    	12  -  Rocky Linux 9"
	echo "    	13  -  Rocky Linux 8"
	echo "    	14  -  CentOS Stream 9"
	echo "    	15  -  CentOS Stream 8"
	echo "    	16  -  CentOS Linux 7"
	echo "    	17  -  SUSE Linux Enterprise Server 15"
	echo ""
	echo "      Microsoft Windows:"
	echo ""
	echo "    	30  -  Windows Server 2022 - All"
	echo "    	31  -  Windows Server 2022 - Standard Only"
	echo "    	32  -  Windows Server 2022 - Datacenter Only"
	echo "    	33  -  Windows Server 2019 - All"
	echo "    	34  -  Windows Server 2019 - Standard Only"
	echo "    	35  -  Windows Server 2019 - Datacenter Only"
	echo "    	36  -  Windows 11"
	echo "    	37  -  Windows 10"
	echo ""
	echo "      Horizon Templates:"
	echo ""
	echo "    	50  -  Windows 11 for Horizon Enterprise"
	echo "    	51  -  Windows 11 for Horizon Pro"
	echo "    	52  -  Windows 11 for Horizon Enterprise Profiler"
	echo "    	53  -  Windows 11 for Horizon Pro Profiler"
	echo "    	54  -  Windows 10 for Horizon Enterprise"
	echo "    	55  -  Windows 10 for Horizon Pro"
	echo "    	56  -  Windows 10 for Horizon Enterprise Profiler"
	echo "    	57  -  Windows 10 for Horizon Pro Profiler"
	echo ""
	echo "      Other:"
	echo ""
	echo "    	80  -  Photon Packer Build"
	echo ""
	echo "        I   -  Information"
	echo "        Q   -  Quit"
	echo ""
	read -r selection
	echo ""
	case $selection in
	1)
		clear
		menu_option_1
		press_enter
		;;
	2)
		clear
		menu_option_2
		press_enter
		;;
	3)
		clear
		menu_option_3
		press_enter
		;;
	4)
		clear
		menu_option_4
		press_enter
		;;
	5)
		clear
		menu_option_5
		press_enter
		;;
	6)
		clear
		menu_option_6
		press_enter
		;;
	7)
		clear
		menu_option_7
		press_enter
		;;
	8)
		clear
		menu_option_8
		press_enter
		;;
	9)
		clear
		menu_option_9
		press_enter
		;;
	10)
		clear
		menu_option_10
		press_enter
		;;
	11)
		clear
		menu_option_11
		press_enter
		;;
	12)
		clear
		menu_option_12
		press_enter
		;;
	13)
		clear
		menu_option_13
		press_enter
		;;
	14)
		clear
		menu_option_14
		press_enter
		;;
	15)
		clear
		menu_option_15
		press_enter
		;;
	16)
		clear
		menu_option_16
		press_enter
		;;
	17)
		clear
		menu_option_17
		press_enter
		;;
	18)
		clear
		menu_option_18
		press_enter
		;;
	19)
		clear
		menu_option_19
		press_enter
		;;
	20)
		clear
		menu_option_20
		press_enter
		;;
	21)
		clear
		menu_option_21
		press_enter
		;;
	22)
		clear
		menu_option_22
		press_enter
		;;
	23)
		clear
		menu_option_23
		press_enter
		;;
	24)
		clear
		menu_option_24
		press_enter
		;;
	25)
		clear
		menu_option_25
		press_enter
		;;	
	26)
		clear
		menu_option_26
		press_enter
		;;	
	27)
		clear
		menu_option_27
		press_enter
		;;	
	28)
		clear
		menu_option_28
		press_enter
		;;	
	29)
		clear
		menu_option_29
		press_enter
		;;		
	30)
		clear
		menu_option_30
		press_enter
		;;	
	31)
		clear
		menu_option_31
		press_enter
		;;
	32)
		clear
		menu_option_32
		press_enter
		;;	
	33)
		clear
		menu_option_33
		press_enter
		;;	
	34)
		clear
		menu_option_34
		press_enter
		;;	
	35)
		clear
		menu_option_35
		press_enter
		;;	
	36)
		clear
		menu_option_36
		press_enter
		;;	
	37)
		clear
		menu_option_37
		press_enter
		;;	
    50)
		clear
		menu_option_50
		press_enter
		;;	
	51)
		clear
		menu_option_51
		press_enter
		;;	
	52)
		clear
		menu_option_52
		press_enter
		;;	
	53)
		clear
		menu_option_53
		press_enter
		;;	
	54)
		clear
		menu_option_54
		press_enter
		;;	
	55)
		clear
		menu_option_55
		press_enter
		;;	
	56)
		clear
		menu_option_56
		press_enter
		;;	
	57)
		clear
		menu_option_57
		press_enter
		;;		
	80)
		clear
		menu_option_80
		press_enter
		;;			
	I)
		clear
		info
		press_enter
		;;
	Q)
		clear
		exit
		;;
	*)
		clear
		incorrect_selection
		press_enter
		;;
	esac
done
