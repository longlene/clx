# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="39ce1e0dcc41ea20b8d23c7603aff9305aa14038"

DESCRIPTION="Easing functions"
HOMEPAGE="https://github.com/vydd/easing"
SRC_URI="https://github.com/vydd/easing/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	example? ( dev-lisp/sketch )
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use example || rm -rf ${PN}-demo.asd demo
	use test || rm -rf ${PN}-test.asd t
}
