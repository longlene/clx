# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bcedffdf685a8ef60eba846df234d484cf2cc9fa"

DESCRIPTION="Common lisp cbor encoder/decoder"
HOMEPAGE="https://github.com/jdtw/cl-cbor"
SRC_URI="https://github.com/jdtw/cl-cbor/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/ieee-floats
	dev-lisp/nibbles
	dev-lisp/babel
	dev-lisp/babel-stream
	dev-lisp/bit-smasher
	dev-lisp/local-time
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-test.asd test
}
