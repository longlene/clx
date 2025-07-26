# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9521146c3a7ced25f8e296e9b2689eef7350803b"

DESCRIPTION="A utility library implementing 2x2, 3x3, 4x4, and NxM matrix functionality"
HOMEPAGE="https://github.com/Shinmera/3d-matrices"
SRC_URI="https://github.com/Shinmera/3d-matrices/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/3d-vectors
"
BDEPEND=""

src_prepare() {
	default
	rm ${PN}-test.asd test.lisp
}
