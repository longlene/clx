# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="b622a2b624201701b834e940bafb01685a2603c1"

DESCRIPTION="Smart octets buffer"
HOMEPAGE="https://github.com/fukamachi/smart-buffer"
SRC_URI="https://github.com/fukamachi/smart-buffer/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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

src_prepare() {
	default
	rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
