# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="94fc87a2bf81355a40ce3730b4ed77710ecfabaf"

DESCRIPTION="Statistical functions in Common Lisp"
HOMEPAGE="https://github.com/Lisp-Stat/statistics"
SRC_URI="https://github.com/Lisp-Stat/statistics/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MS-PL"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/anaphora
	dev-lisp/alexandria
	dev-lisp/distributions
	dev-lisp/let-plus
	dev-lisp/numerical-utilities
	dev-lisp/conduit-packages
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem #:statistics\/tests/,$d' \
		-i ${PN}.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all description.text lh-description.text
}
