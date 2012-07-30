# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
# Nonofficial ebuild by danielpi

EAPI="0"

inherit eutils autotools

DESCRIPTION="Toolkit for building and manipulating hidden Markov models. Primarily used for speech recognition."
HOMEPAGE="http://htk.eng.cam.ac.uk/"
SRC_URI="http://htk.eng.cam.ac.uk/ftp/software/${P}.tar.gz"

LICENSE="HTK"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
RESTRICT="fetch"

S="${WORKDIR}/htk"

pkg_nofetch() {
	einfo "Please download ${A} from:"
	einfo "  ${HOMEPAGE}"
	einfo "and move it to ${DISTDIR}"
	einfo "In order to do so, you will have to register and get a download code."
	echo
}

src_unpack() {
	unpack ${A}
	cd "${S}"
	eautoreconf
}

src_compile() {
	econf --prefix="${D}"
	emake -j1 DESTDIR="${D}" || die "make failed"
}

src_install() {
	emake -j1 DESTDIR="${D}" install || die "install failed"
}
