# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d8d47abba000e3444eceb5a1607aeeab05a088ff"

DESCRIPTION="Dyna is an AWS DynamoDB ORM for Common Lisp"
HOMEPAGE="https://github.com/Rudolph-Miller/dyna"
SRC_URI="https://github.com/Rudolph-Miller/dyna/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-syntax
	dev-lisp/dexador
	dev-lisp/ironclad
	dev-lisp/flexi-streams
	dev-lisp/cl-base64
	dev-lisp/quri
	dev-lisp/local-time
	dev-lisp/jsown
	dev-lisp/split-sequence
	dev-lisp/alexandria
	dev-lisp/closer-mop
	dev-lisp/sxql
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
