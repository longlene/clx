# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9117990397b7d75fda35b50c724be7cd1c33085a"

DESCRIPTION="Lisp-Stat main system"
HOMEPAGE="https://github.com/Lisp-Stat/lisp-stat"
SRC_URI="https://github.com/Lisp-Stat/lisp-stat/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MS-PL"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/array-operations
	dev-lisp/cl-semver
	dev-lisp/data-frame
	dev-lisp/dfio
	dev-lisp/num-utils
	dev-lisp/select
	dev-lisp/split-sequence
	dev-lisp/cl-csv
	dev-lisp/dexador
	dev-lisp/make-hash
	dev-lisp/cl-ascii-table
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem :lisp-stat\/tests/,$d' ${PN}.asd
	rm -r tests
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.sexp LICENSE pkgdcls.lisp ls-init.lisp
}
