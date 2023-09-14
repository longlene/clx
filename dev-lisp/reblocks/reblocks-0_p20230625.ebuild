# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c4248dae21e27aaadcce1404cc4ba033e6584548"

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
	rm -r ${PN}-tests.asd t
}
