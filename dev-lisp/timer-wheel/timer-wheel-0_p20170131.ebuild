# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6cdcb93b2cdc45b5dc963d061f96a0801b61aa83"

DESCRIPTION="A portable single-layer timer wheel implementation"
HOMEPAGE="https://github.com/npatrick04/timer-wheel"
SRC_URI="https://github.com/npatrick04/timer-wheel/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use example || rm -r ${PN}.examples.asd examples
	use test || rm -r ${PN}.test.asd test
}
