# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2bf98a5d26ba759a5fae246effb953237a467eea"

DESCRIPTION="A utility library implementing quaternion and dual-quaternion functionality"
HOMEPAGE="https://github.com/Shinmera/3d-quaternions"
SRC_URI="https://github.com/Shinmera/3d-quaternions/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/3d-vectors
	dev-lisp/3d-matrices
"
BDEPEND=""

src_prepare() {
	default
	rm ${PN}-test.asd test.lisp
}
