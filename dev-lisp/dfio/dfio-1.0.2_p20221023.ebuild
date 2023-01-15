# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5caf473acb9bc464839e87395724cbd941167915"

DESCRIPTION="Data Frame I/O"
HOMEPAGE="https://github.com/Lisp-Stat/dfio"
SRC_URI="https://github.com/Lisp-Stat/dfio/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MS-PL"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/data-frame
	dev-lisp/dexador
	dev-lisp/fare-csv
	dev-lisp/let-plus
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem :dfio\/tests/,$d' \
		-i ${PN}.asd
	rm tests.lisp
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all description.text
}

