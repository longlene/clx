# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="OpenFst is a library for constructing, combining, optimizing, and searching"
HOMEPAGE="http://www.openfst.org/"
SRC_URI="http://www.openfst.org/twiki/pub/FST/FstDownload/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_install() {
	emake DESTDIR="${D}" install
	dodoc README NEWS AUTHORS
}
