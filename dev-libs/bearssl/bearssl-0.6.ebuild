# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A smaller SSL/TLS library"
HOMEPAGE="https://bearssl.org/"
SRC_URI="https://bearssl.org/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins inc/*.h
	dobin build/brssl
	dolib.a build/libbearssl.a
	dodoc README.txt
}
