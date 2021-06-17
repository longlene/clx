# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="A portable and extensible Common Lisp Reader"
HOMEPAGE="https://github.com/s-expressionists/Eclector"
SRC_URI="https://github.com/s-expressionists/Eclector/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/closer-mop
	dev-lisp/acclimation
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem "eclector\/test/,$d' ${PN}.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.sexp
}
