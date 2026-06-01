# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f06e9b8bb8111f9643f7988dcb9b98705887e1ed"

DESCRIPTION="An implementation of the Language Server Protocol for Common Lisp"
HOMEPAGE="https://github.com/cxxxr/cl-lsp"
SRC_URI="https://github.com/cxxxr/cl-lsp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
	dev-lisp/lem
	dev-lisp/jsonrpc
	dev-lisp/command-line-arguments
"

export CL_SOURCE_REGISTRY="${S}":/usr/share/common-lisp/systems

src_prepare() {
	default
	sed -e 's#src/main.lisp#main.lisp#' \
		-i Makefile
	sed -i '/defsystem "cl-lsp\/test/,$d' ${PN}.asd
	rm -rf test
}

src_compile() {
	#emake
	sbcl \
		--eval '(asdf:load-system :cl-lsp/executable)' \
		--eval '(asdf:make :cl-lsp/executable)'
}
