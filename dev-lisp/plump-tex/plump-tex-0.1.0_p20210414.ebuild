# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="88af743135c93dacece0f2f6be47da22f82aef6b"

DESCRIPTION="Rudimentary parser turning TeX-like syntax into a Plump DOM"
HOMEPAGE="https://github.com/Shinmera/plump-tex"
SRC_URI="https://github.com/Shinmera/plump-tex/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/plump
	dev-lisp/cl-ppcre
"
BDEPEND=""

src_prepare() {
	default
	rm ${PN}-test.{asd,lisp}
}
