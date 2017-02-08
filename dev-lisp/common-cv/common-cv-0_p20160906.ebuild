# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d9f1d400035db98b9c433be8dc70314527b1f416"

DESCRIPTION="The Wrapper of OpenCV for CommonLisp"
HOMEPAGE="https://github.com/byulparan/common-cv"
SRC_URI="https://github.com/byulparan/common-cv/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/simple-utils
	dev-lisp/alexandria
	dev-lisp/cffi
	media-libs/opencv
"

src_compile() {
	emake -C C
}

src_install() {
	common-lisp-3_src_install
	exeinto ${CLSOURCEROOT}/${CLPACKAGE}/C
	doexe C/libopencv_wrap
}
