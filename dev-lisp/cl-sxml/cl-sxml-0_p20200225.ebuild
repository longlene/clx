# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 git-r3

EGIT_COMMIT="e5542b1d9bd6cee03ae27547d00660ccfbb60109"

DESCRIPTION="XML in S-expressions"
HOMEPAGE="https://github.com/eadmund/cl-sxml/"
SRC_URI="https://github.com/eadmund/cl-sxml/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cxml
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem #:cl-sxml-test/,$d' ${PN}.asd
		rm test.lisp
	fi
}
