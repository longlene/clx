# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="037038c273fe2875d83e097e1fe63bed420939ff"

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
	rm ${PN}-test.asd test.lisp */test.lisp
}
