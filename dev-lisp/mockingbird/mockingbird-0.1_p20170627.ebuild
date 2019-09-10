# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="bf56e15faf8684fb96bd8094bd76c2d1b966c0ae"

DESCRIPTION="A small stubbing and mocking library for Common Lisp"
HOMEPAGE="https://github.com/Chream/mockingbird"
SRC_URI="https://github.com/Chream/mockingbird/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/fare-utils
	dev-lisp/alexandria
	test? ( dev-lisp/prove )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd t
}
