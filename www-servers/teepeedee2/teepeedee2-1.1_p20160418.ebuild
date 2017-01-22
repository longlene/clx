# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="4"

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1b12505b70d11ad0722a603b69e761193bd12488"

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
	use test || rm -rf ${PN}-test.asd t
}

