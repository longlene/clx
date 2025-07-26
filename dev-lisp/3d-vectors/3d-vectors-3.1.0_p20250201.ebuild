# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

EGIT_COMMIT="e703669090b1df42b2524121a0cae87a702fcab5"

DESCRIPTION="A utility library implementing 2D, 3D, and 4D vector functionality"
HOMEPAGE="https://github.com/Shinmera/3d-vectors"
SRC_URI="https://github.com/Shinmera/3d-vectors/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

src_prepare() {
	default
	rm -rf ${PN}-test.asd test.lisp
}
