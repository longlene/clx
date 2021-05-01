# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d5a33a5a3b2d2b0e1b391e9cb1455078f291b92e"

DESCRIPTION="dbq"
HOMEPAGE="https://github.com/quek/dbq/"
SRC_URI="https://github.com/quek/dbq/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/postmodern
	dev-lisp/closer-mop
	dev-lisp/anaphora
	dev-lisp/cl-ppcre
	dev-lisp/local-time
	dev-lisp/fast-io
	dev-lisp/ieee-floats
	dev-lisp/cl-json
	dev-lisp/log4cl
	test? ( dev-lisp/fiasco )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}.test.asd test
}
