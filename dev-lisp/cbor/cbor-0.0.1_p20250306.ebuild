# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

EGIT_COMMIT="e1428a50e6c78045fec0e4c7e3229567d01e433e"

DESCRIPTION=""
HOMEPAGE="https://github.com/mishoo/cbor.lisp"
SRC_URI="https://github.com/mishoo/cbor.lisp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-lisp/trivial-utf8
	dev-lisp/ieee-floats
	dev-lisp/local-time
	dev-lisp/closer-mop
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/cbor.lisp-${EGIT_COMMIT}

src_prepare() {
	default
	rm -rf cbor-tests.asd test
}
