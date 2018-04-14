# shellcheck shell=bash
# shellcheck disable=SC2034

CENTOS_VERSIONS="7"

CENTOS_RPMS="
compat-dapl compat-dapl-utils
dapl dapl-utils
ibutils
infiniband-diags
infinipath-psm
libibcommon
libibverbs libibverbs-utils
librdmacm-utils ibacm
mstflint
opensm
patch
qperf
pciutils
"

# Change newlines into spaces for `sed'.
CENTOS_RPMS="$(echo "${CENTOS_RPMS}" | tr '\n' ' ')"

COMMANDS="
ibdiagnet
ibv_devinfo
qperf
"

IMAGE=jumanjiman/infiniband
