# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils autotools

DESCRIPTION="FX2 Programming Tool"
HOMEPAGE="http://www.triplespark.net/elec/periph/USB-FX2/software/"
SRC_URI="http://www.triplespark.net/elec/periph/USB-FX2/software/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

pkg_setup() {
	enewgroup cycfx2prog
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	RES="${D}/usr/bin/cycfx2prog"
	mkdir -p "${D}/usr/bin" || die "Failed to create target directory"
	cp cycfx2prog "${RES}" || die "Failed to copy binary to target"
	fowners root:cycfx2prog /usr/bin/cycfx2prog || die "Failed to set owner"
	fperms 6550 /usr/bin/cycfx2prog || die "Failed to set sticky bit"
	elog "Users need to be added to the group cycfx2prog to use this program as"
	elog "it is installed suid root for that group. this is required as normal users"
	elog "do not have permission to access the FX2 device."
}
