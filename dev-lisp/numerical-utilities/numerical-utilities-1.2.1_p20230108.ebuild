# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="69f1c52096396fded26760f714ebacbbc66a1c92"

DESCRIPTION="Utilities for numerical programming"
HOMEPAGE="https://github.com/Lisp-Stat/numerical-utilities"
SRC_URI="https://github.com/Lisp-Stat/numerical-utilities/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MS-PL"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/anaphora
	dev-lisp/alexandria
	dev-lisp/alexandria-plus
	dev-lisp/array-operations
	dev-lisp/select
	dev-lisp/let-plus
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem "num-utils\/tests/,$' \
		-i num-utils.asd
}
