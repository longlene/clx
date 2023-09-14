# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="cb6ce51e2f87bf1d589f3703c13eea6e25780afe"

DESCRIPTION="MGL-GPR is a library of evolutionary algorithms"
HOMEPAGE="https://github.com/melisgl/mgl-gpr"
SRC_URI="https://github.com/melisgl/mgl-gpr/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-random
	dev-lisp/mgl-pax
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}-test.asd test example
}
