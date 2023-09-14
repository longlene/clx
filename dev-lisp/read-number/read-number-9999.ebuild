# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Reading numbers from an input stream without using the Lisp reader"
HOMEPAGE="https://github.com/ralph-schleicher/read-number"
SRC_URI=""

EGIT_REPO_URI="https://github.com/ralph-schleicher/read-number.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/lisp-unit
"

src_prepare() {
	eapply_user
	rm tests.lisp
}
