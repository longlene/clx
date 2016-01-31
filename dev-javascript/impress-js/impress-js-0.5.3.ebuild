# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  ranger Exp $

EAPI="4"

DESCRIPTION="a presentation framework based on CSS3 transforms and transitions inspired by prezi.com"
HOMEPAGE="http://bartaz.github.com/impress.js"
SRC_URI="mirror://github/bartaz/impress.js/tarball/${PV} -> ${P}.tar.gz"

IUSE=""
LICENSE="MIT GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_unpack() {
	unpack ${A}
}

src_install() {
	mkdir -p "${D}"/usr/share/"${PN}"
	cp -r "${WORKDIR}"/bartaz-impress.js-e8fbd0c/* "${D}"/usr/share/"${PN}"/
}
