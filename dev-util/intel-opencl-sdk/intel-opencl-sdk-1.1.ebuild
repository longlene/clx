# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/valgrind/valgrind-3.6.0.ebuild,v 1.1 2010/11/10 01:40:41 blueness Exp $

# Adapted from http://aur.archlinux.org/packages/intel-opencl-sdk/PKGBUILD

EAPI=4

inherit rpm

DESCRIPTION="Intel's implementation of the OpenCL standard optimized for Intel processors."
HOMEPAGE="http://software.intel.com/en-us/articles/opencl-sdk/"

if [[ "${ARCH}" == "amd64" ]]; then
    _arch="x86_64"
    _other_arch="x86"
    _bits="64"
elif [[ "${ARCH}" == "x86" ]]; then
    _arch="x86"
    _other_arch="x86_64"
    _bits="32"
    die "Does not support 32 bit."
fi

SRC_URI="http://software.intel.com/file/35820/${PN/-/_}_${PV}_lnx_${_bits}.rpm"
LICENSE="intel-opencl-sdk"
SLOT="1.1"
KEYWORDS="~amd64"


RDEPEND="app-admin/eselect-opengl
        sys-devel/llvm
        dev-cpp/tbb
        sys-process/numactl
        || ( dev-util/opencl-headers dev-util/nvidia-cuda-toolkit )"
DEPEND="${RDEPEND}
        app-arch/libarchive"

RESTRICT="mirror strip"

QA_EXECSTACK="*"

S=${WORKDIR}

src_unpack () {
    # FIXME: rpm_src_unpack does not work... Don't know why. The error is:
    # bzip2: (stdin) is not a bzip2 file.
    # rpm2tar: /var/tmp/portage/dev-util/intel-opencl-sdk-1.1/distdir/intel_opencl-sdk_1.1_lnx_64.rpm: failed to extract cpio via bzip2 (not actually an RPM?)
    # tar: This does not look like a tar archive
    # tar: Exiting with failure status due to previous errors
    #rpm_src_unpack ${A}
    bsdtar -xf ${DISTDIR}/${A}
}


src_install() {

    _ipath="/opt/intel/opencl-sdk"

    # Register ICD
    # OpenCL ICD specifications: http://www.khronos.org/registry/cl/extensions/khr/cl_khr_icd.txt
    mkdir -p "${D}/etc/OpenCL/vendors"
    echo "${_ipath}/libintelocl.so" > "${D}/etc/OpenCL/vendors/intel.icd"

    # Install files
    insinto ${_ipath}
    doins "${WORKDIR}/usr/lib64/libOpenCL.so"
    pushd ${WORKDIR}/usr/lib64/OpenCL/vendors/intel/
    for f in *.so *rtl *pch; do
        doins ${f}
    done
    popd

    # FIXME: provide a way to change /usr/lib/libOpenCL.so from different vendors
    # Symlink libs
    #mkdir -p "${pkgdir}/usr/lib"
    #ln -s "${_ipath}/libOpenCL.so" "${pkgdir}/usr/lib/libOpenCL.so"
}
