# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit ninja-utils vcs-snapshot

EGIT_COMMIT="fba47e89ea9e923e225130dbe638a1708b415a55"

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/clasp-developers/clasp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-lisp/alexandria
	dev-lisp/sbcl
	sys-devel/llvm
	sys-devel/clang
"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	./koga --skip-sync || die "prepare failed"
}

src_compile() {
	eninja -C build
}
