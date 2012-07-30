# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

inherit eutils

DESCRIPTION="An image conversion utility for the Nintendo GBA and DS."
HOMEPAGE="http://www.coranac.com/projects/grit/"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86"
SLOT="0"
SRC_URI="http://www.coranac.com/files/${PN}/${PN}-src-${PV}.zip"
DEPEND=">=media-libs/freeimage-3"
RDEPEND="${DEPEND}"

S="${WORKDIR}/grit_src"

src_unpack() {
	unpack ${A}
	epatch "${FILESDIR}/grit_main.patch"
	epatch "${FILESDIR}/cli.patch"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	dobin "${S}/grit" || die "install failed"
}
