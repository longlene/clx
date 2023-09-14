# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="52d3d99b02f793d174a8058fd3daa6cb6cea35f6"

DESCRIPTION="option parser for Common Lisp"
HOMEPAGE="https://github.com/ta2gch/trivial-argv"
SRC_URI="https://github.com/ta2gch/trivial-argv/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/alexandria
	test? ( dev-lisp/1am )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem trivial-argv\/test/,$d' ${PN}.asd
		rm test.lisp
	fi
}
