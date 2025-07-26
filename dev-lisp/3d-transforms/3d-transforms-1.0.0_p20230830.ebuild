# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3f62ac47728f55d37ab7f0458521c99824739c48"

DESCRIPTION="A utility library implementing a common structure to encapsulate spatial transformations"
HOMEPAGE="https://github.com/Shinmera/3d-transforms"
SRC_URI="https://github.com/Shinmera/3d-transforms/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/3d-vectors
	dev-lisp/3d-matrices
	dev-lisp/3d-quaternions
"
BDEPEND=""

src_prepare() {
	default
	rm ${PN}-test.asd test.lisp
}
