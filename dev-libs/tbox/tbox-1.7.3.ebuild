# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A glib-like multi-platform c library"
HOMEPAGE="https://tboox.org"
SRC_URI="https://github.com/tboox/tbox/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	./configure --prefix=/usr --mode=debug || die "configure failed"
}

src_install() {
	emake DESTDIR="${D}" install
	rm -rf "${D}"/usr/bin
}
