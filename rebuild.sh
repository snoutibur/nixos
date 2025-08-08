#!/usr/bin/env bash
set -euo pipefail

# Accepts hostname argument, else default to current hostname
HOSTNAME="${1:-$(hostname)}"

# Logging #
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
    exit 1
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

main() {
    # Flake dir check
    if [[ ! -f "flake.nix" ]]; then
        error "No flake.nix found in current directory."
    fi

    log "Building NixOS configuration for: $HOSTNAME"
    log "Running: sudo nixos-rebuild switch --flake .#$HOSTNAME"

    # Run the rebuild
    if sudo nixos-rebuild switch --flake ".#$HOSTNAME"; then
        log "✅ Completed successfully!"
    else
        error "❌ Failed!"
    fi
}

# Show help if requested
if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
    cat << EOF
Usage: $(basename "$0") [HOSTNAME]

nixos-rebuild wrapper for rebuilding the NixOS config

Arguments:
  HOSTNAME    The hostname/configuration to build (optional)
              Defaults to: $(hostname)

Examples:
  $(basename "$0")          # Build using current hostname
  $(basename "$0") desktop  # Build configuration named 'desktop'
  $(basename "$0") laptop   # Build configuration named 'laptop'

Make sure you're in your flake directory before running this script.
EOF
    exit 0
fi

main "$@"