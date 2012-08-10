# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit rpm

DESCRIPTION="Intel's implementation of the OpenCL standard optimized for Intel processors."
HOMEPAGE="http://software.intel.com/en-us/articles/vcsource-tools-opencl-sdk/"

SRC_URI="http://registrationcenter.intel.com/irc_nas/2563/intel_sdk_for_ocl_applications_${PV}_x64.tgz"
LICENSE="Apache-2.0 Boost-1.0 BSD Intel-OpenCL-SDK"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gui"

RDEPEND="app-admin/eselect-opencl
        sys-process/numactl
        gui? ( virtual/jre gnome-extra/zenity )"
DEPEND="${RDEPEND}"

RESTRICT="mirror"
QA_PREBUILT="
    usr/bin/ioc
    usr/lib64/OpenCL/vendors/intel/*.so"

S="${WORKDIR}"

src_unpack () {
    unpack ${A}
    cd "${S}"
    rpm_unpack ./intel_ocl_sdk_${PV}_x64.rpm
}

src_prepare() {
    epatch ${FILESDIR}/iocgui-dont-use-spaces-for-variable-declaration.patch
}

src_install() {
    # Register ICD
    # OpenCL ICD specifications: http://www.khronos.org/registry/cl/extensions/khr/cl_khr_icd.txt
    insinto /etc/OpenCL/vendors
    doins etc/OpenCL/vendors/intelocl64.icd

    insinto /usr/lib64/OpenCL/vendors/intel

    # Intel Offline Compiler
    newbin usr/lib64/OpenCL/vendors/intel/ioc64 ioc
    if use gui; then
        newbin /usr/lib64/OpenCL/vendors/intel/iocgui64.sh iocgui
        doins /usr/lib64/OpenCL/vendors/intel/ioc.jar
    fi

    doins usr/lib64/OpenCL/vendors/intel/opencl_.pch
    doins usr/lib64/OpenCL/vendors/intel/version.txt

    doins usr/lib64/OpenCL/vendors/intel/*.rtl
    insopts -m0755
    doins usr/lib64/OpenCL/vendors/intel/llc
    doins usr/lib64/OpenCL/vendors/intel/*.so*

    # Install libOpenCL.so into /usr/lib64/OpenCL/vendors/intel and let eselect-opencl select the right one
    insinto /usr/lib64/OpenCL/vendors/intel/
    doins usr/lib64/libOpenCL.so
    # Headers are not _eactly_ the same as what eselect-opencl provides.
    # Install them just in case
    doins -r usr/include/CL

    insinto /usr/portage/licenses/
    newins license.txt Intel-OpenCL-SDK
}
