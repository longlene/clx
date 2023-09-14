# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0f53ca731e6b2673ab6839daa6a68f47a42e42c1"

DESCRIPTION="Tree-Sitter bindings for Common Lisp"
HOMEPAGE="https://github.com/death/cl-tree-sitter"
SRC_URI="https://github.com/death/cl-tree-sitter/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/babel
	dev-lisp/cffi
	dev-libs/tree-sitter
"
BDEPEND=""

src_compile() {
	emake
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all tree-sitter-wrapper.so
}
