# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2 common-lisp-3

DESCRIPTION="Smart octets buffer"
HOMEPAGE="https://github.com/fukamachi/smart-buffer"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fukamachi/smart-buffer.git"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/xsubseq
	dev-lisp/flexi-streams
	dev-lisp/uiop
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
