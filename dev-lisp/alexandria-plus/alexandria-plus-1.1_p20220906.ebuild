# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="adafb09838a84895bedb119f8253b89b6a04a2c5"

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
