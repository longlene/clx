# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="LibLZF is a very small, very fast data compression library"
HOMEPAGE="http://oldhome.schmorp.de/marc/liblzf.html"
SRC_URI="http://dist.schmorp.de/liblzf/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""

src_prepare() {
	default
	sed -i -e 's/^   CFLAGS=.*$/   :/' configure.ac || die "sed failed"
	sed -i -e 's/\(\$([a-z]*dir)\)/$(DESTDIR)\1/' Makefile.in || die "sed failed"
	eautoreconf
}

src_install() {
	emake install DESTDIR="${D}"
	einstalldocs
}
