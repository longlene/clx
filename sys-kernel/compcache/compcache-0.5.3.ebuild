# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator linux-info linux-mod

MY_PV=$(delete_version_separator '_')

DESCRIPTION="Compressed RAM as fast swap"
HOMEPAGE="http://compcache.googlecode.com"
SRC_URI="http://compcache.googlecode.com/files/${PN}-${MY_PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="virtual/linux-sources"

S="${WORKDIR}/${PN}-${MY_PV}"

BUILD_TARGETS="all"
MODULE_NAMES="ramzswap(compcache:${S}:${S})
        xvmalloc(:${S}:${S}/sub-projects/allocators/xvmalloc-kmod)"

BUILD_PARAMS='KV_OUT_DIR="${KV_OUT_DIR}"'

src_unpack() {
        unpack $A
        sed -i -e 's#/lib/modules/$(shell uname -r)/build#"$(KV_OUT_DIR)"#' \
                "${S}/Makefile" \
                "${S}/sub-projects/compression/lzo-kmod/Makefile" \
                "${S}/sub-projects/allocators/xvmalloc-kmod/Makefile"
}

src_install(){
        linux-mod_src_install

#       newconfd "${FILESDIR}"/compcache-confd compcache || die "newconfd failed"
#       newinitd "${FILESDIR}"/compcache-initd compcache || die "newinitd failed"

        dodoc Changelog README || die "dodoc failed"
}

