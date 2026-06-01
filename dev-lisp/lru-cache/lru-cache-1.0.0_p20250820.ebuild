# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="53d0f846103ad7df690fc01ccd8d5a0a26220079"

inherit common-lisp-3

DESCRIPTION="A least-recently-used cache datastructure"
HOMEPAGE="https://codeberg.org/shinmera/lru-cache"
SRC_URI="https://codeberg.org/shinmera/lru-cache/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
S="${WORKDIR}"/${PN}
KEYWORDS="~amd64"

RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
"

src_prepare() {
	default
	rm ${PN}-test.asd test.lisp
}
