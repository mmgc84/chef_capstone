#!/bin/bash
set -o nounset

CHEFWS_TARGET_VERSION=21.2.278
CHEFWS_INSTALLED_VERSION=$(chef --version 2>/dev/null |awk '/Chef Workstation version:/ {print $NF}')
if [[ "${CHEFWS_INSTALLED_VERSION}" == "" ]]; then
  echo "Installing Chef Workstation ${CHEFWS_TARGET_VERSION}"
  curl --silent --show-error https://omnitruck.chef.io/install.sh | \
    sudo -E bash -s -- -c stable -P chef-workstation -v ${CHEFWS_TARGET_VERSION}
fi

echo 'eval "$(chef shell-init bash)"' >> ~/.bashrc
eval "$(chef shell-init bash)"
echo "Downloading cookbook dependencies with Berkshelf"
berks vendor

echo "Running chef-client in local mode"
sudo chef-client --local-mode \
  --config-option cookbook_path="$(pwd)/berks-cookbooks" \
  --override-runlist chef_workstation

echo "Cleaning up"
sudo rm -rf nodes
sudo rm -rf berks-cookbooks

