# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

TS_BINDINGS=( python )

inherit tree-sitter-grammar

EGIT_COMMIT="07dad1469ecb7df80f2b6d5178f79564d19d67e0"

DESCRIPTION="Tree-sitter Grammar for Erlang"
HOMEPAGE="https://github.com/WhatsApp/tree-sitter-erlang"
SRC_URI="https://github.com/WhatsApp/tree-sitter-erlang/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

src_prepare() {
	default
	rm pyproject.toml
	tree-sitter-grammar_src_prepare
}

src_install() {
	tree-sitter-grammar_src_install
	insinto /usr/include/tree_sitter
	doins bindings/c/tree-sitter-erlang.h
	einstalldocs
}
