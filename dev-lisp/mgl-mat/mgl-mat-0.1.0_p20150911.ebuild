# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3

EGIT_COMMIT="10be6a8ff5c7300da7267977111f8f9a2d86e76a"

DESCRIPTION="MAT is library for working with multi-dimensional arrays which supports efficient interfacing to foreign and CUDA code"
HOMEPAGE="https://github.com/melisgl/mgl-mat"
SRC_URI="https://github.com/melisgl/mgl-mat/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/bordeaux-threads
	dev-lisp/cffi
	dev-lisp/cl-cuda
	dev-lisp/flexi-streams
	dev-lisp/ieee-floats
	dev-lisp/lla
	dev-lisp/mgl-pax
	dev-lisp/static-vectors
	dev-lisp/trivial-garbage
	test? ( dev-lisp/cl-fad )
"

src_prepare() {
	use test || rm -rf ${PN}-test.asd test
}
