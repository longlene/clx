# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ea2c9846f0ccf47c0f30b8e787ec7c64bbbf244a"

DESCRIPTION="Read and write binary records in Common Lisp"
HOMEPAGE="https://github.com/snunez1/binary-types"
SRC_URI="https://github.com/snunez1/binary-types/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/ieee-floats
	dev-lisp/array-operations
	test? (
		dev-lisp/clunit2
		dev-lisp/flexi-streams
		dev-lisp/cl-num-utils
	)
"
BDEPEND=""

src_prepare() {
	default
	if use !test ; then
		sed -e '/defsystem "binary-types\/tests"/,$d' \
			-i ${PN}.asd
		rm -rf tests
	fi
}
