# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="A Unix shell interface for Common Lisp"
HOMEPAGE="https://github.com/Neronus/clesh"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Neronus/clesh.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-shell
	dev-lisp/named-readtables
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}-tests.{asd,lisp}
}
