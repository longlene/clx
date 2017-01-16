# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="ad47dc3b494e9293d1f087aebb099bdba832de5e"

DESCRIPTION="System Information Gatherer And Reporter"
HOMEPAGE="http://sigar.hyperic.com/"
SRC_URI="https://github.com/hyperic/sigar/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e '/sigar_skip_token/{s#SIGAR_INLINE##}' -i src/sigar_util.c
	sed -e '/sigar_skip_token/{s#SIGAR_INLINE##}' -i include/sigar_util.h
	sed -e '/sigar_skip_multiple_token/{s#SIGAR_INLINE##}' -i src/sigar_util.c
	sed -e '/sigar_skip_multiple_token/{s#SIGAR_INLINE##}' -i include/sigar_util.h

	use test || sed -e '/build-tests/d' -i CMakeLists.txt
}
