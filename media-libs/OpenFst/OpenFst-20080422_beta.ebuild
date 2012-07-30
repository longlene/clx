# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit multilib

DESCRIPTION="OpenFst is a library for constructing, combining, optimizing, and searching weighted finite-state transducers (FSTs)."
HOMEPAGE="http://www.openfst.org/"
SRC_URI="http://cims.nyu.edu/~openfst/twiki/pub/FST/FstDownload/${PN}-beta-${PV/_beta*/}.tgz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

MY_P="${WORKDIR}/${PN}"

src_compile() {
	cd "${MY_P}/fst"
	emake all || die "make failed"
}

src_install() {
	mkdir -p "${D}usr/include/fst/lib"
	mkdir -p "${D}usr/$(get_libdir)"
	cp "${MY_P}/fst/lib/"*.h "${D}usr/include/fst/lib"
	cp "${MY_P}/fst/lib/"*.a "${D}usr/$(get_libdir)"

	cd "${MY_P}"
	dodoc README
}
