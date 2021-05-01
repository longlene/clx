# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="OpenFst is a library for constructing, combining, optimizing, and searching weighted finite-state transducers (FSTs)."
HOMEPAGE="http://www.openfst.org/"
SRC_URI="http://www.openfst.org/twiki/pub/FST/FstDownload/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_install() {
	emake DESTDIR="${D}" install
	dodoc README NEWS AUTHORS
}
