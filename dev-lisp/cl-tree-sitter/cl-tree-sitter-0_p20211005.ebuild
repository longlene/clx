# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0cb37c75450fb0199ab0187e23e0ec9157dc5c73"

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
