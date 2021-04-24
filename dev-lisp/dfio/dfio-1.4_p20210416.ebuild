# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="32908cf99b04d695c8bb34bda1b3c097f3266a72"

DESCRIPTION="Read tabular data into data frames"
HOMEPAGE="https://github.com/Lisp-Stat/dfio"
SRC_URI="https://github.com/Lisp-Stat/dfio/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MS-PL"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/cl-csv
	dev-lisp/data-frame
	dev-lisp/let-plus
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem :dfio\/tests/,$d' ${PN}.asd
	rm tests.lisp
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.sexp
}
