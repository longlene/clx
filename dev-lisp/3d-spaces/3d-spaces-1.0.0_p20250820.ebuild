# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="48b909d4416dc0a9b442e15a078775e84dc21b9f"

inherit common-lisp-3

DESCRIPTION="Implementations of various spatial query structures"
HOMEPAGE="https://codeberg.org/shirakumo/3d-spaces"
SRC_URI="https://codeberg.org/shirakumo/3d-spaces/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/3d-math
	dev-lisp/text-draw
	dev-lisp/trivial-extensible-sequences
	dev-lisp/for
	dev-lisp/nibbles
	dev-lisp/babel
"
BDEPEND=""

S="${WORKDIR}"/${PN}

src_prepare() {
	default
	sed -e '/defsystem 3d-spaces\/test/,$d' \
		-i ${PN}.asd
	rm -rf test
}
