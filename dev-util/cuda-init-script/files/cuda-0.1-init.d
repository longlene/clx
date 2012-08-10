#!/sbin/runscript

# Inspired by http://forums.nvidia.com/index.php?showtopic=52629

description="Create NVIDIA device nodes in /dev"

# opts="${opts} module_is_loaded"

function get_number_N3D() {
    /usr/sbin/lspci | grep -i NVIDIA | grep "3D controller" | wc -l
}

function get_number_NVGA() {
    /usr/sbin/lspci | grep -i NVIDIA | grep "VGA compatible controller" | wc -l
}

# Remove /dev nodes for nvidia devices
function nodes_remove() {
    rm -f /dev/nvidia*
    return $?
}

function nodes_create() {
    # Count the number of NVIDIA controllers found.
    N3D=`get_number_N3D`
    NVGA=`get_number_NVGA`

    # Create /dev nodes for nvidia devices
    N=`expr $N3D + $NVGA - 1`
    for i in `seq 0 $N`; do
        mknod -m 666 /dev/nvidia$i c 195 $i
        RETVAL=$?
        [ "$RETVAL" = 0 ] || eend $RETVAL
    done

    mknod -m 666 /dev/nvidiactl c 195 255
    RETVAL=$?
    [ "$RETVAL" = 0 ] || eend $RETVAL

    return $RETVAL
}

function module_load() {
    modprobe nvidia
    return $?
}

function module_unload() {
    modprobe -r nvidia
    return $?
}

function module_is_loaded() {
    mod=`lsmod | grep nvidia | wc -l`
    if [[ "${mod}" == "0" ]]; then
        #echo "NVIDIA module is not loaded"
        return 1
    else
        #echo "NVIDIA module is loaded"
        return 0
    fi
}

start() {
    ebegin "${description}"

    module_is_loaded || module_load

    nb_dev=`ls /dev/nvidia* 2> /dev/null | wc -l`

    nodes_create

    eend 0
}

stop() {
    ebegin "Clearing NVIDIA nodes"

    nodes_remove  || eend $?
    module_unload || eend $?

    eend 0
}

