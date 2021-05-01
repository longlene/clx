# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a2ed78c51d782993591c3284562daeed3aba3d40"

DESCRIPTION="A fast webapplication framework for dynamic webpages in Common Lisp."
HOMEPAGE="http://github.com/vii/teepeedee2"
SRC_URI="https://github.com/vii/teepeedee2/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	dev-lisp/trivial-garbage
	dev-lisp/cl-cont
	dev-lisp/cffi
	dev-lisp/iterate
	dev-lisp/alexandria
	dev-lisp/cl-irregsexp
	>dev-lisp/trivial-backtrace-1.0.2
	dev-lisp/parenscript
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	default
	use test || rm -rf ${PN}-test.asd t
}

