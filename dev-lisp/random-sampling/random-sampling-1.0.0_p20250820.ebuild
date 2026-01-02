# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="c8bbcb069566fae7a2cae00e7b63a1d0f4f38045"

inherit common-lisp-3

DESCRIPTION="Functions to generate random samples with various distributions"
HOMEPAGE="https://codeberg.org/shinmera/random-sampling"
SRC_URI="https://codeberg.org/shinmera/random-sampling/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/random-state
	dev-lisp/3d-math
"
BDEPEND=""

S="${WORKDIR}"/${PN}

src_prepare() {
	default
	sed -e '/defsystem random-sampling\/test/,$d' \
		-i ${PN}.asd
	rm test.lisp
}
