# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8e170cfd4a7d8397e533b6287fe71a57210e46d8"

DESCRIPTION="A Speechi Synthesis System"
HOMEPAGE="https://github.com/masatoi/cljtalk"
SRC_URI="https://github.com/masatoi/cljtalk/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/wiz-util
	dev-lisp/clgplot
	dev-lisp/cffi
	dev-lisp/cl-libworld
	dev-lisp/cl-ppcre
	dev-lisp/parse-number
	dev-lisp/mgl-user
	test? ( dev-lisp/prove )
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.org
}
