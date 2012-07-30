# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
DESCRIPTION="Enable compiling code and loading it on ATI/AMD GPU"
HOMEPAGE="http://developer.amd.com/gpu/AMDAPPSDK/Pages/default.aspx"
SRC_URI="x86? ( http://download2-developer.amd.com/amd/APPSDK/AMD-APP-SDK-v${PV}-lnx32.tgz )
         amd64? ( http://download2-developer.amd.com/amd/APPSDK/AMD-APP-SDK-v${PV}-lnx64.tgz )"

LICENSE="AMD GPL-1 as-is"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="livecd examples doc"
RESTRICT="strip"
RDEPEND="!livecd? ( >=x11-drivers/ati-drivers-11.7 )
	app-admin/eselect-opencl
	examples? ( media-libs/glew )"

QA_EXECSTACK="
	opt/amd-app-sdk/lib/x86/libamdocl32.so
	opt/amd-app-sdk/lib/x86_64/libamdocl64.so
"

src_unpack() {
    if [ "${A}" != "" ]; then
	if use amd64; then 
		tar xvf ${DISTDIR}/${A} AMD-APP-SDK-v${PV}-RC2-lnx64.tgz --to-stdout | tar xz
	else
		tar xvf ${DISTDIR}/${A} AMD-APP-SDK-v${PV}-RC2-lnx32.tgz --to-stdout | tar xz
	fi
    fi
}


src_install() {
	local DEST=/opt/amd-app-sdk
	insinto ${DEST}
	
	if use amd64; then
	   cd AMD-APP-SDK-v${PV}-RC2-lnx64 || die
	else
	   cd AMD-APP-SDK-v${PV}-RC2-lnx32 || die
	fi

	if use amd64; then
		if use multilib; then
			dosym ../..${DEST}/lib/x86/libamdocl32.so    /usr/lib32/
		else
			rm -rf bin/x86 lib/x86
		fi
		dosym ../..${DEST}/lib/x86_64/libamdocl64.so /usr/lib64/
	else
		dosym ../..${DEST}/lib/x86/libamdocl32.so  /usr/lib/
		rm -rf bin/x86_64 lib/x86_64
	fi

	# Install executables
	insopts -m0755
	doins -r bin
	# Install libraries
	doins -r lib

    
	# Install includes
	# only selected header; not  glew
	insinto ${DEST}/include
	insopts -m0644
	doins -r include/*
    
	# Install examples & docs
	if use examples; then
		insinto ${DEST}
		doins -r samples
		doins -r make
	fi

	if use doc; then
		insinto ${DEST}
		doins -r docs
	fi

	# install OpenCL installable client driver
	# What should we do with the absolute symlink?
	dodir   /etc/OpenCL/vendors
	if use amd64; then
		echo "libamdocl64.so" > ${D}/etc/OpenCL/vendors/amdocl64.icd
	fi
	echo "libamdocl32.so" > ${D}/etc/OpenCL/vendors/amdocl32.icd

	# Create env file
	echo "ATISTREAMSDKROOT=${DEST}" > 99${PN}
	doenvd 99${PN}

}

