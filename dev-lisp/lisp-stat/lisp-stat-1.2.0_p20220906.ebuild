# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="357a0d2b5f68a5ff925776235c2b7455e12b78ba"

DESCRIPTION="Lisp-Stat main system"
HOMEPAGE="https://github.com/Lisp-Stat/lisp-stat"
SRC_URI="https://github.com/Lisp-Stat/lisp-stat/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MS-PL"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/alexandria-plus
	dev-lisp/array-operations
	dev-lisp/data-frame
	dev-lisp/distributions
	dev-lisp/dexador
	dev-lisp/dfio
	dev-lisp/numerical-utilities
	dev-lisp/select
	dev-lisp/statistics
	dev-lisp/conduit-packages
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/#+ignore/,$d' ${PN}.asd
	rm -r tests
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.sexp LICENSE
}
