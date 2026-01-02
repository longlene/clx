# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="20a36dee90d65ae68c3eb674e058087d2b42a0c2"

inherit common-lisp-3

DESCRIPTION="An implementation of the Quickhull convex hull construction algorithm"
HOMEPAGE="https://codeberg.org/shirakumo/quickhull"
SRC_URI="https://codeberg.org/shirakumo/quickhull/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/3d-math
	dev-lisp/documentation-utils
"
BDEPEND=""

S="${WORKDIR}"/${PN}

src_prepare() {
	default
	sed -e '/defsystem quickhull\/test/,$d' \
		-i ${PN}.asd
	rm -rf test
}
