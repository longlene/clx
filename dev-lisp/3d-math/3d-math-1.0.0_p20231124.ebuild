# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ae106a8952e0cf91b754f50cba3a4ff49643513e"

DESCRIPTION="A library implementing the necessary linear algebra math for 2D and 3D computations"
HOMEPAGE="https://github.com/Shinmera/3d-math"
SRC_URI="https://github.com/Shinmera/3d-math/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/type-templates
"
BDEPEND=""

src_prepare() {
	default
	rm ${PN}-test.asd test.lisp vectors/test.lisp \
		matrices/test.lisp quaternions/test.lisp \
		dual-quaternions/test.lisp \
		transforms/test.lisp
}
