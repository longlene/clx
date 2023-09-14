# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2fc4865b76490d67420409cbca780575d426c707"

DESCRIPTION="A Disque client for Common Lisp"
HOMEPAGE="https://github.com/CodyReichert/cl-disque"
SRC_URI="https://github.com/CodyReichert/cl-disque/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/rutils
	dev-lisp/cl-ppcre
	dev-lisp/usocket
	dev-lisp/flexi-streams
	dev-lisp/babel
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}
