# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

TS_BINDINGS=( python )

inherit tree-sitter-grammar

EGIT_COMMIT="12b547b470a4213dc63a20c7bd2db988d85c7693"

DESCRIPTION="Elisp grammar for tree-sitter"
HOMEPAGE="https://github.com/Wilfred/tree-sitter-elisp"
SRC_URI="https://github.com/Wilfred/tree-sitter-elisp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
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
	doins bindings/c/tree-sitter-elisp.h
	einstalldocs
}
