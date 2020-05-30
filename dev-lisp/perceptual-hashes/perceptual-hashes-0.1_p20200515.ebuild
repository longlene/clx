# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9316db77eea2a90f82d103e82b9299bd2da6427f"

DESCRIPTION="Perceptual image hashing for Common Lisp"
HOMEPAGE="https://github.com/shamazmazum/perceptual-hashes"
SRC_URI="https://github.com/shamazmazum/perceptual-hashes/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/imago
	dev-lisp/jpeg-turbo
	dev-lisp/array-operations
	test? ( dev-lisp/fiveam )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/perceptual-hashes\/tests/,$d' ${PN}.asd
		rm -r tests
	fi
}
