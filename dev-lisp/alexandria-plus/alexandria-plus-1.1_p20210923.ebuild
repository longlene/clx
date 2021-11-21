# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0617994ef39e6dc956987dd999d4c38af1110db0"

DESCRIPTION="A conservative set of extensions to Alexandria utilities"
HOMEPAGE="https://github.com/Symbolics/alexandria-plus/"
SRC_URI="https://github.com/Symbolics/alexandria-plus/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MS-PL"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"
BDEPEND=""

src_prepare() {
	default
	sed -i '/defsystem "alexandria+\/tests"/,$d' alexandria+.asd
	rm -rf tests
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.sexp
}
