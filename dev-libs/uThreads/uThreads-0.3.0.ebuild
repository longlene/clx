# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="A concurrent user-level thread library implemented in C++"
HOMEPAGE="https://github.com/samanbarghi/uThreads"
SRC_URI="https://github.com/samanbarghi/uThreads/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e "/DEST_DIR/{s#/usr/local#${D}/usr#}" \
		-e '/ldconfig/d' \
		-e '/ln/{s#$(DEST_DIR)/lib/##}' \
		-e "s#\$(DEST_DIR)/lib#\$(DEST_DIR)/$(get_libdir)#g" \
		-i Makefile
}

#src_install() {
#	dolib.so lib/libuThreads.so.*
#	insinto /usr/include/uThreads
#	doins include/uThreads.h
#	dodoc README.md
#}
