# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit tree-sitter-grammar

DESCRIPTION="Erlang grammar for Tree-sitter"
HOMEPAGE="https://github.com/samgaw/tree-sitter-erl"
SRC_URI="https://github.com/samgaw/${PN}/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DOCS=( CHANGELOG.md README.md )

src_prepare() {
	rm -r ./pyproject.toml ./test/highlight || die
	tree-sitter-grammar_src_prepare
}

src_install() {
	tree-sitter-grammar_src_install
	einstalldocs
}
