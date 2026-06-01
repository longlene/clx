# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit ninja-utils

SRC_URI="https://github.com/clasp-developers/clasp/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-lisp/alexandria
	dev-lisp/sbcl
	llvm-core/llvm
	llvm-core/clang
"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	./koga --skip-sync || die "prepare failed"
}

src_compile() {
	eninja -C build
}
