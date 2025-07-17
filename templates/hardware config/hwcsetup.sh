#!/bin/sh

set -e
sudo mkdir -p /etc/nixos/hardware-configuration
cd /etc/nixos/hardware-configuration

echo "Generating hardware config"
nixos-generate-config --show-hardware-config > hardware-configuration.nix

echo "Creating flake wrapper"
cat > flake.nix <<EOF
{
  description = "External hardware config for Nix";

  outputs = { self }: {
    nixosModules.configuration = import ./hardware-configuration.nix;
  };
}
EOF

echo "yaaaay!"
