# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5847987440211e6eec331be2ef5264a94ee5f3ad"

DESCRIPTION="common lisp/cffi bindings for Open Asset Import Library"
HOMEPAGE="http://assimp.sourceforge.net/"
SRC_URI="https://github.com/3b/classimp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	media-libs/assimp
	example? ( dev-lisp/sb-cga dev-lisp/cl-opengl dev-lisp/cl-fad dev-lisp/cl-ilut )
"

src_prepare() {
	use example || rm -r ${PN}-samples.asd *sample*.lisp files.lisp
}

