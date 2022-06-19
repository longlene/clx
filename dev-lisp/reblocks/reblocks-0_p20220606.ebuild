# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c760ab5ea98051cbd6ee79b0d2b9d305431cdd0c"

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
