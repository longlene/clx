# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Aucdtect is a CD authenticity detector."
HOMEPAGE="http://true-audio.com/Tau_Analyzer_-_Aucdtect_Algorithm_Details"
SRC_URI="http://www.true-audio.com/ftp/${P}.tgz"

LICENSE="Freeware"
RESTRICT="mirror"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="app-emulation/emul-linux-x86-compat"
RDEPEND="${DEPEND}"

src_install() {
	mkdir -p "${D}/usr/bin"
	cp "${S}/auCDtect" "${D}/usr/bin"
}

src_unpack() {
	unpack ${A}
}

