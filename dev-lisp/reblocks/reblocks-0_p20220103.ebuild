# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="09a3a4a38846fd00dcd9bf2d637c6280abcb4dd2"

DESCRIPTION="Reblocks Common Lisp web framework "
HOMEPAGE="https://github.com/40ants/reblocks"
SRC_URI="https://github.com/40ants/reblocks/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clack
	dev-lisp/cl-strings
	dev-lisp/metatilities
	dev-lisp/alexandria
	dev-lisp/cl-ppcre
	dev-lisp/log4cl
	dev-lisp/ironclad
"
BDEPEND=""

src_prepare() {
	default
	rm -r ${PN}-test.asd t
}
