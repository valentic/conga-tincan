# conga-tincan
CONGA TEC station operating system

To build:

    git clone --recurse-submodules https://github.com/valentic/conga-tincan.git
    cd conga-tincan

    ./scripts/run_podman_buildroot.sh

    make conga-tincan-ts7250v3-v1_defconfig all
