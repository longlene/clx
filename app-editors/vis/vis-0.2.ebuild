# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Vis a vim-like text editor"
HOMEPAGE="https://github.com/martanne/vis"
SRC_URI="https://github.com/martanne/vis/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
#KEYWORDS="~amd64 ~arm ~x86"
IUSE="acl +lua selinux"

DEPEND="
	lua? ( dev-lua/lpeg )
	dev-libs/libtermkey
"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i '/LDFLAGS_STD/{s/-lc//}' configure
}

src_configure() {
	econf \
		$(use_enable acl) \
		$(use_enable lua) \
		$(use_enable selinux)
}
