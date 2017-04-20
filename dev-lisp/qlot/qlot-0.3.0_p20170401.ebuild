# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e1163934c98035b309d1d2840ab6d01550c0c2e5"

DESCRIPTION="A project-local library installer for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/qlot"
SRC_URI="https://github.com/fukamachi/qlot/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd tests
}
