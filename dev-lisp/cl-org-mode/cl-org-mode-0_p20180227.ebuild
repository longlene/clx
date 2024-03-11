# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a45eadade90d64ec0d543b6a2befcb302d63fdbb"

DESCRIPTION=""
HOMEPAGE="https://github.com/deepfire/cl-org-mode"
SRC_URI="https://github.com/deepfire/cl-org-mode/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/iterate
	dev-lisp/parser-combinators
	dev-lisp/split-sequence
	dev-lisp/ironclad
	dev-lisp/flexi-streams
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-tests.asd ${PN}-extended-tests.asd t
}
