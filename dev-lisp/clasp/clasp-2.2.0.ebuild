# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit ninja-utils

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/clasp-developers/clasp/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

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
