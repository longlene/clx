# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="415a45506421c7737ed8e7edcf26600ff4a550aa"

DESCRIPTION="A logic programming library for Common Lisp"
HOMEPAGE="https://github.com/sjl/temperance"
SRC_URI="https://github.com/sjl/temperance/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-arrows
	dev-lisp/policy-cond
	test? ( dev-lisp/lam )
"

src_prepare() {
	eapply_user
	rm Makefile
	use test || rm ${PN}.test.asd test package.test.lisp
}

