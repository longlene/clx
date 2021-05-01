# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="cc42363f8e10748d40facc7fb5b5db59c75d7a3f"

DESCRIPTION="cl-selenim-webdriver is a binding library to the Selenium 2.0"
HOMEPAGE="https://github.com/TatriX/cl-selenium-webdriver"
SRC_URI="https://github.com/TatriX/cl-selenium-webdriver/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	!dev-lisp/cl-selenium
	dev-lisp/dexador
	dev-lisp/quri
	dev-lisp/cl-json
	dev-lisp/alexandria
	dev-lisp/split-sequence
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -r selenium-test.asd t
}
