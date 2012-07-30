# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="C++ integration layer for Twisted"
HOMEPAGE="http://itamarst.org/software/"
SRC_URI="http://itamarst.org/software/fusion-0.2.1.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=dev-python/twisted-2.0.1
	>=dev-libs/boost-1.33.1"

RDEPEND="${DEPEND}"

S="${WORKDIR}/fusion"

src_compile() {
	python setup.py build || die "fusion compilation failed"
}

src_install() {
	dodoc LICENSE example/* || die "dodoc failed"
	python setup.py install --root="${D}" || die "installation failed"
}
