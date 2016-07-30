# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Events for Common Lisp"
HOMEPAGE="https://github.com/deadtrickster/cl-events"
SRC_URI=""

EGIT_REPO_URI="https://github.com/deadtrickster/cl-events.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/iterate
	dev-lisp/log4cl
	dev-lisp/lparallel
	dev-lisp/blackbird
	test? ( dev-lisp/prove dev-lisp/mw-equiv )
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}.test.asd t
}
