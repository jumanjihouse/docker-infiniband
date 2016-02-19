CENTOS_VERSIONS="6 7"

CENTOS_RPMS="
compat-dapl compat-dapl-utils
dapl dapl-utils
ibutils
infiniband-diags
infinipath-psm libcxgb3 libcxgb4 libipathverbs libmthca libmlx4 libmlx5 libnes libocrdma
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
CENTOS_RPMS="$( echo ${CENTOS_RPMS} | tr '\n' ' ')"

COMMANDS="
ibdiagnet
ibv_devinfo
qperf
"

IMAGE=jumanjiman/infiniband
