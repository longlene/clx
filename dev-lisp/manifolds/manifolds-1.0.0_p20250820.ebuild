# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="eaecb0f25b0abc6ba765a24a46cc8d815d03cbaa"

inherit common-lisp-3

DESCRIPTION="Implementations of various manifold mesh algorithms"
HOMEPAGE="https://codeberg.org/shirakumo/manifolds"
SRC_URI="https://codeberg.org/shirakumo/manifolds/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/3d-math
	dev-lisp/3d-spaces
	dev-lisp/documentation-utils
"
BDEPEND=""

S="${WORKDIR}"/${PN}

src_prepare() {
	default
	sed -e '/defsystem manifolds\/test/,$d' \
		-i ${PN}.asd
	rm -rf test
}
