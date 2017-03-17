# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c99e69c15d935eabc671b483349a406e0da9518d"

DESCRIPTION="Python-like Annotation Syntax for Common Lisp."
HOMEPAGE="https://github.com/m2ym/cl-annot"
SRC_URI="https://github.com/m2ym/cl-annot/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE="test"

RDEPEND="
	dev-lisp/alexandria
	test? ( dev-lisp/cl-test-more )
"

src_prepare() {
	use test || rm -rf ${PN}-test.asd t
}

