# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit multilib

DESCRIPTION="OpenFst is a library for constructing, combining, optimizing, and searching weighted finite-state transducers (FSTs)."
HOMEPAGE="http://www.openfst.org/"
SRC_URI="http://mohri-lt.cs.nyu.edu/twiki/pub/FST/FstDownload/openfst-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

S="${WORKDIR}/openfst-${PV}"

src_compile() {
	econf || die "econf failed"
	emake || die "make failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	dodoc README NEWS AUTHORS
}
