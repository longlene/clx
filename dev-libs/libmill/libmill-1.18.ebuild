# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Go-style concurrency in C"
HOMEPAGE="http://libmill.org"
SRC_URI="http://libmill.org/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="static"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	econf --enable-static=$(usex static)
}
