# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="428392adb1d0c5da8f1d4d282498c40b10c143d4"

DESCRIPTION="A portable and extensible Common Lisp Reader"
HOMEPAGE="https://github.com/s-expressionists/Eclector"
SRC_URI="https://github.com/s-expressionists/Eclector/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
	rm -rf test
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.sexp
}
