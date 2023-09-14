# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7481aae3ca11a79c117dd6fbc4e3bf2122a89627"

DESCRIPTION="A portable plotter for Common Lisp"
HOMEPAGE="https://github.com/komi1230/kai"
SRC_URI="https://github.com/komi1230/kai/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-opengl
	test? ( dev-lisp/rove )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd test ${PN}-example.asd examples
}
